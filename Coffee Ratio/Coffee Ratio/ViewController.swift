//
//  ViewController.swift
//  Coffee Ratio
//
//  Created by John Peden on 5/28/16.
//  Copyright © 2016 John Peden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var coffeeTF: UITextField!
  @IBOutlet var coffeeRatioTF: UITextField!
  @IBOutlet var waterRatioTF: UITextField!
  @IBOutlet var waterGramsLabel: UILabel!
  var startTime = TimeInterval()
  var timer = Timer()
  var timerRunning = false

  @IBOutlet var displayTimeLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    let backgroundImage = UIImageView(frame: UIScreen.main().bounds)
    backgroundImage.image = UIImage(named: "background")
    self.view.insertSubview(backgroundImage, at: 0)
    let myColor : UIColor = UIColor( red: 255, green: 255, blue:255, alpha: 1.0 )
    coffeeTF.layer.borderColor = myColor.cgColor
    coffeeTF.layer.borderWidth = 1
//    coffeeRatioTF.layer.borderColor = myColor.CGColor
//    waterRatioTF.layer.borderColor = myColor.CGColor

//    coffeeRatioTF.layer.borderWidth = 1
//    waterRatioTF.layer.borderWidth = 1
    
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
    
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
    view.endEditing(true)
  }
  
  @IBAction func editingChanged(_ sender: UITextField) {
    if ((coffeeTF.text != nil) && (coffeeRatioTF.text != nil) && (waterRatioTF.text != nil)) {
      let waterGrams = ((waterRatioTF.text! as NSString).floatValue) * ((coffeeTF.text! as NSString).floatValue)
      
      waterGramsLabel.text = NSString(format: "%.1f", waterGrams) as String
      
      if waterGrams == 0.0 {
        waterGramsLabel.text = ""
      }
      
    }
    
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func updateTime() {
    
    let currentTime = Date.timeIntervalSinceReferenceDate
    
    //Find the difference between current time and start time.
    
    var elapsedTime: TimeInterval = currentTime - startTime
    
    //calculate the minutes in elapsed time.
    
    let minutes = UInt8(elapsedTime / 60.0)
    
    elapsedTime -= (TimeInterval(minutes) * 60)
    
    //calculate the seconds in elapsed time.
    
    let seconds = UInt8(elapsedTime)
    
    elapsedTime -= TimeInterval(seconds)
    
    //find out the fraction of milliseconds to be displayed.
    
    //let fraction = UInt8(elapsedTime * 100)
    
    //add the leading zero for minutes, seconds and millseconds and store them as string constants
    
    let strMinutes = String(format: "%02d", minutes)
    let strSeconds = String(format: "%02d", seconds)
    //let strFraction = String(format: "%02d", fraction)
    
    //concatenate minuets, seconds and milliseconds as assign it to the UILabel
    
    displayTimeLabel.text = "\(strMinutes):\(strSeconds)"
  }
  
  @IBAction func start(_ sender: AnyObject) {
    if !timer.isValid {
      let aSelector : Selector = #selector(ViewController.updateTime)
      timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: aSelector,     userInfo: nil, repeats: true)
      startTime = Date.timeIntervalSinceReferenceDate
    }
  }
  
  @IBAction func stop(_ sender: AnyObject) {
    timer.invalidate()
  }
  
  @IBAction func clear() {
    displayTimeLabel.text = "00:00"
  }
}

