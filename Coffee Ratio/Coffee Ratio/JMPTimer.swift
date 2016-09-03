//
//  JMPTimer.swift
//  JMPTimer
//
//  Created by John Peden on 7/26/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import Foundation
import UIKit

class JMPTimer {

  /* Variables */
  var days = 0
  var hours = 0
  var minutes = 0
  var seconds = -1
  var miliseconds = 0
  var timerLabel = UILabel()
  var timer = Timer()
  var timerRunning = false
  var timeAsString = "" {
    willSet {
      timerLabel.text = "\(newValue)"
    }
  }
  
  init() {
  }

  init(withLabel label: UILabel) {
    timerLabel = label
  }
  
  /* Methods */
  @objc func updateTimer() {
    seconds += 1
    if seconds == 60 {
      minutes += 1
      seconds = 0
      if minutes == 60 {
        hours += 1
        minutes = 0
        if hours == 24 {
          days += 1
          hours = 0
        }
      }
    }
    timeAsString = String(format: "%02d:%02d", minutes, seconds)
    print(timeAsString)
  }
}

// MARK: - Basic Timer Controls
extension JMPTimer {
  func start() {
    if !timerRunning {
      timerRunning = true
      let selector = #selector(JMPTimer.updateTimer)
      timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: selector, userInfo: nil, repeats: true)
      timer.fire()
    }
  }
  
  func stop() {
    timerRunning = false
    timer.invalidate()
  }
  
  func clear() {
    timeAsString = "00:00"
    seconds = -1
    minutes = 0
    hours = 0
    days = 0
  }
}
