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

    @State var buttonText: String = "Start"
    @State var timerText: String = "00:00"
    @State private var timerState: TimerState = .paused
    @State private var secondsPassed = 0

    private let viewModel = TimerViewModel()

    var body: some View {
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
            }) {
                Text("Reset")
                .font(.system(size: 17))
                .fixedSize()
                .foregroundColor(Color("Primary"))
            }
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

