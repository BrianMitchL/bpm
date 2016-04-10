//
//  ViewController.swift
//  BPM
//
//  Created by Brian Mitchell and Zach Litzinger on 4/8/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var bpmDisplay: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var X: Double = 1         //Initial Duration between the taps
    var P: Double = 0.1       //Initial confidence in the measurements of the values of x
    var Q: Double = 0.00001   //Constant error: you know that you are often slow
    var A: Double = 1         // ------- might be important?
    var H: Double = 0.001      //How accurately we believe the instrument is measuring
    var R: Double = 0.00001 //Speed of response to variants
    
    var lastTime: NSDate? = nil
    

    @IBAction func bpmTap(sender: BMButton) {
        let currentTime = NSDate()
        if lastTime == nil {
            lastTime = NSDate(timeIntervalSinceNow: -1)
        }
        let timeDiff = currentTime.timeIntervalSinceDate(lastTime!)
        let calculation = correct(timeDiff)
        lastTime = currentTime
        bpmDisplay.text = "\(Int(60.0 / calculation))"
    }
    
    func predict() {
        X = A * X
        P = A * P + Q
    }
    
    func correct(measurement: Double) -> Double {
        predict()
        let K = P * (1 / (P + R))
        X = X + K * (measurement - X)
        P = (1 - K) * P
        return X
    }
    
//    func calculateBPM(timeDiff: NSTimeInterval, average: Double, newCount: Int) -> Double {
//        if newCount > 2 {
//            count = 1
//        }
//        return ((60/timeDiff) + Double(average) * Double(newCount)) / Double(newCount + 1)
//    }
}

