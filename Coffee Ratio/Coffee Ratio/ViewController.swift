/*
 MIT License
 
 Copyright (c) 2016 John Mahlon Peden
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

// Color: 41 41 49

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var coffeeTF: UITextField!
  @IBOutlet var coffeeRatioTF: UITextField!
  @IBOutlet var waterRatioTF: UITextField!
  @IBOutlet var waterGramsLabel: UILabel!
  @IBOutlet var displayTimeLabel: UILabel!
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var resetButton: UIButton!
  
  var timer = JMPTimer()
  var waterValues: [String]?
  var coffeeValues: [String]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    waterValues = ["18.5", "0.375"]
    coffeeValues = ["1", "1"]
    

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
  
  @objc func dismissKeyboard() {
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
      
      waterGramsLabel.text = NSString(format: "%.2f", waterGrams) as String
      
      if waterGrams == 0.0 {
        waterGramsLabel.text = ""
      }
    }
  }
  
  @IBAction func start(_ sender: AnyObject) {
    if timer.timerRunning {
      timer.stop()
      startButton.setTitle("Start", for: .normal)
    } else {
      timer.start()
      startButton.setTitle("Stop", for: .normal)
    }
  }
  
  @IBAction func reset(_ sender: AnyObject) {
    timer.clear()
  }
  
  @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
    waterRatioTF.text = waterValues?[sender.selectedSegmentIndex]
    
    
    
  }
  
  
}

