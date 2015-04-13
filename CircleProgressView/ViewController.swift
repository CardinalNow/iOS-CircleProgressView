//
//  ViewController.swift
//  CircleProgressView
//
//  Created by Eric Rolf on 8/11/14.
//  Copyright (c) 2014 Eric Rolf, Cardinal Solutions Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var circleProgressView: CircleProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var clockwiseSwitch: UISwitch!
    
    let nf = NSNumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        nf.numberStyle = NSNumberFormatterStyle.DecimalStyle
        nf.maximumFractionDigits = 2
        
        self.clockwiseSwitch.setOn(self.circleProgressView.clockwise, animated: false)
        self.progressSlider.value = Float(self.circleProgressView.progress)
        self.progressLabel.text = "Progress: " + nf.stringFromNumber(NSNumber(double: self.circleProgressView.progress))!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - IBActions

    @IBAction func sliderDidChangeValue(sender: AnyObject) {
        let slider:UISlider = sender as! UISlider
        self.circleProgressView.progress = Double(slider.value)
        self.progressLabel.text = "Progress: " + nf.stringFromNumber(NSNumber(double: self.circleProgressView.progress))!
    }
    
    @IBAction func switchDidChangeValue(sender: AnyObject) {
        let mySwitch:UISwitch = sender as! UISwitch
        self.circleProgressView.clockwise = mySwitch.on
        self.circleProgressView.progress = self.circleProgressView.progress
    }

    // MARK: - Helpers
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}
