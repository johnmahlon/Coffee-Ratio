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
  @IBOutlet var displayTimeLabel: UILabel!
  
  var timer = JMPTimer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    

    timer = JMPTimer(withLabel: displayTimeLabel)
    
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    backgroundImage.image = UIImage(named: "background")
    self.view.insertSubview(backgroundImage, at: 0)
    let myColor : UIColor = UIColor( red: 255, green: 255, blue:255, alpha: 1.0 )
    coffeeTF.layer.borderColor = myColor.cgColor
    coffeeTF.layer.borderWidth = 1
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
    
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
    view.endEditing(true)
  }
  
  func calculateWaterInGrams(coffee: Float, water: Float) -> Float {
    return coffee * water
  }
  
  @IBAction func editingChanged(_ sender: UITextField) {
    if ((coffeeTF.text != nil) && (coffeeRatioTF.text != nil) && (waterRatioTF.text != nil)) {
      //let waterGrams = ((waterRatioTF.text! as NSString).floatValue) * ((coffeeTF.text! as NSString).floatValue)
      
      let coffeeLabelAsFloat = (coffeeTF.text! as NSString).floatValue
      let waterValueAsFloat = (waterRatioTF.text! as NSString).floatValue
      let waterGrams = calculateWaterInGrams(coffee: coffeeLabelAsFloat, water: waterValueAsFloat)
      
      waterGramsLabel.text = NSString(format: "%.1f", waterGrams) as String
      
      if waterGrams == 0.0 {
        waterGramsLabel.text = ""
      }
    }
  }
  
  @IBAction func start(_ sender: AnyObject) {
    timer.start()
  }
  
  @IBAction func stop(_ sender: AnyObject) {
    timer.stop()
  }
  
  @IBAction func clear() {
    timer.clear()
  }
}

