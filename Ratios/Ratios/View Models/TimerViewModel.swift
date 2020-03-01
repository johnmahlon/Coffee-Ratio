//
//  TimerViewModel.swift
//  Ratios
//
//  Created by John Peden on 2/27/20.
//  Copyright © 2020 John Peden. All rights reserved.
//

import Foundation
import Combine

class TimerViewModel {
    public var timer = Timer.publish(every: 1, on: .current, in: .common)
    private var cancellableTimer: Cancellable?

    public func start() {
        cancellableTimer = timer.connect()
    }

    public func stop() {
        guard let cTimer = cancellableTimer else {
            return
        }

        cTimer.cancel()
        timer = Timer.publish(every: 1, on: .current, in: .common)
    }
}
