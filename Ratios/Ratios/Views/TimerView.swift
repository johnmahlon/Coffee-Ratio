//
//  TimerView.swift
//  Ratios
//
//  Created by John Peden on 2/26/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import SwiftUI
import Combine

private enum TimerState {
    case running
    case paused
}

struct TimerView: View {
    
    @Binding var timerType: Int
    @State var buttonText: String = "Start"
    @State var timerText: String = "00:00"
    @State var timeRemaining: String = ""
    @State private var timerState: TimerState = .paused
    @State private var secondsPassed = 0
    
    private let viewModel = TimerViewModel()
    private let availableMinutes = Array(1...59)
    
    var body: some View {
        
        if timerType == 0 {
            
        } else {
            
        }
        
        switch timerType {
        case 0: // Count up Timer
            VStack {
                Text(timerText)
                    .font(.system(size: 64))
                    .frame(width: CGFloat(300), height: CGFloat(52))
                    .onReceive(viewModel.timer) { date in
                        self.secondsPassed += 1
                        
                        let hours = String(format: "%02d", self.secondsPassed / 60)
                        let minutes = String(format :"%02d", self.secondsPassed % 60)
                        self.timerText = "\(hours):\(minutes)"
                    }
                
                Spacer()
                    .frame(height: 20)
            }
        default: // Count down Timer
            Spacer()
                .frame(height: 23.6)
            VStack {
                TextField("00:00", text: $timeRemaining)
                    .font(.system(size: 64))
                    .frame(width: CGFloat(300), height: CGFloat(52))
                    .multilineTextAlignment(.center)
                    .onReceive(viewModel.timer) { _ in
                        let splitTime = timeRemaining.components(separatedBy: ":")
                        var intTime = (splitTime.first! as NSString).integerValue + (splitTime.last! as NSString).integerValue
                        if intTime > 0 {
                            intTime -= 1
                        }
                        
                        let hours = String(format: "%02d", intTime / 60)
                        let minutes = String(format :"%02d", intTime % 60)
                        self.timeRemaining = "\(hours):\(minutes)"
                    }
                
                Spacer()
                    .frame(height: 20)
            }
        }
        
        // Moved code for buttons here so code isn't repeated
        Button(action: handleButtonPress) {
            Text(buttonText)
                .font(.system(size: 20))
                .fixedSize()
                .frame(width: CGFloat(200), height: CGFloat(52))
                .background(Color("Primary"))
                .cornerRadius(CGFloat(10))
                .foregroundColor(Color("AltText"))
        }
        
        Spacer()
            .frame(height: 12)
        
        Button(action: {
            self.timerState = .paused
            self.viewModel.stop()
            self.buttonText = "Start"
            self.secondsPassed = 0
            self.timerText = "00:00"
            self.timeRemaining = ""
        }) {
            Text("Reset")
                .font(.system(size: 17))
                .fixedSize()
                .foregroundColor(Color("Primary"))
        }
    }
    
    func handleButtonPress() {
        switch timerState {
        case .running:
            viewModel.stop()
            buttonText = "Start"
            timerState = .paused
            
        case .paused:
            viewModel.start()
            buttonText = "Pause"
            timerState = .running
        }
    }
}

