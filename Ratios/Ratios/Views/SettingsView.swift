//
//  SettingsView.swift
//  Ratios
//
//  Created by Mark Kim on 3/3/21.
//  Copyright © 2021 John Peden. All rights reserved.
//

import SwiftUI

struct SettingsView : View {
    @GestureState private var dragState = DragState.inactive
    @Binding var isShown: Bool
    @State public var countUpOrDown = 0
    @State public var defaultMeasureUnit = 0
    @State private var defaultRatio: String = ""
        
    private let settingsModel = SettingsViewModel()
    
    private func onDragEnded(drag: DragGesture.Value) {
        let dragThreshold = modalHeight * (2/3)
        if drag.predictedEndTranslation.height > dragThreshold || drag.translation.height > dragThreshold{
            isShown = false
        }
    }
    
    var modalHeight:CGFloat = 400
    //    var content: () -> Content
    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)
        return Group {
            ZStack {
                //Background
                Spacer()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    .background(isShown ? Color.black.opacity( 0.5 * fraction_progress(lowerLimit: 0, upperLimit: Double(modalHeight), current: Double(dragState.translation.height), inverted: true)) : Color.clear)
                    .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                self.isShown = false
                            }
                    )
                
                //Foreground
                VStack{
                    Spacer()
                    ZStack{
                        Color.white.opacity(1.0)
                            .frame(width: UIScreen.main.bounds.size.width, height:modalHeight)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                        HStack {
                            VStack {
                                Text("Timer")
                                    .font(.system(size: 17))
                                    .frame(width: UIScreen.main.bounds.size.width/2 - 25, height: 25, alignment: .leading)
                                
                                Spacer()
                                    .frame(height: 30)
                                
                                Text("Unit of Measurement")
                                    .font(.system(size: 17))
                                    .frame(width: UIScreen.main.bounds.size.width/2 - 25, height: 25, alignment: .leading)
                                
                                Spacer()
                                    .frame(height: 30)
                                
                                Text("Default Ratio")
                                    .font(.system(size: 17))
                                    .frame(width: UIScreen.main.bounds.size.width/2 - 25, height: 25, alignment: .leading)
                            }
                            .frame(width: UIScreen.main.bounds.size.width/2 - 25, height: modalHeight, alignment: .leading)
                            .padding(.leading, 25)
                            
                            VStack {
                                Picker(selection: $countUpOrDown, label: Text(""), content: {
                                    Text("Count Up").tag(0)
                                    Text("Count Down").tag(1)
                                })
                                .pickerStyle(SegmentedPickerStyle())
                                                                
                                Spacer()
                                    .frame(height: 30)
                                
                                Picker(selection: $defaultMeasureUnit, label: Text("Picker"), content: {
                                    Text("Grams").tag(0)
                                    Text("Tbsp").tag(1)
                                })
                                .pickerStyle(SegmentedPickerStyle())
                                
                                Spacer()
                                    .frame(height: 30)
                                
                                TextField("", text: $defaultRatio, onCommit:  {
                                    settingsModel.saveRatio(water: defaultRatio)
                                })
                                .frame(width: 100, height: 35)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("Primary"), lineWidth: 2)
                                )
                                .multilineTextAlignment(.center)
                            }
                            .frame(width: UIScreen.main.bounds.size.width/2 - 25, height: modalHeight)
                            .padding(.trailing, 25)
                        }
                    }
                    .offset(y: isShown ? ((self.dragState.isDragging && dragState.translation.height >= 1) ? dragState.translation.height : 0) : modalHeight)
                    .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                    .gesture(drag)
                    
                    
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}



func fraction_progress(lowerLimit: Double = 0, upperLimit: Double, current: Double, inverted: Bool = false) -> Double {
    var val: Double = 0
    if current >= upperLimit {
        val = 1
    } else if current <= lowerLimit {
        val = 0
    } else {
        val = (current - lowerLimit)/(upperLimit - lowerLimit)
    }
    
    if inverted {
        return (1 - val)
    } else {
        return val
    }
}
