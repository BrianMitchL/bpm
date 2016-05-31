//
//  MainViewController.swift
//  BPM
//
//  Created by Brian Mitchell and Zach Litzinger on 4/8/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController {
    var loadTheme: Bool = {
        Style.loadTheme()
        return true
    }()
    
    @IBOutlet weak var bpmDisplay: UILabel!
    @IBOutlet weak var bpmTap: BMButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTheme()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateTheme()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTheme() {
        self.view.backgroundColor = Style.backgroundColor
        UIApplication.sharedApplication().statusBarStyle = Style.statusbarStyle
        bpmDisplay.textColor = Style.tintColor
        bpmDisplay.font = Style.bpmDisplayFont
        bpmTap.titleLabel?.font = Style.bpmTapFont
        bpmTap.setTitleColor(Style.tintColor, forState: UIControlState.Normal)
        bpmTap.strokeColor = Style.bpmTapColor
        bpmTap.rippleColor = Style.bpmTapRippleColor
        self.view.tintColor = Style.tintColor
    }
    
    // BPM logic and functionality
    
    var X: Double = 0.0
    var P: Double = 0.0
    var Q: Double = 0.0
    var A: Double = 0.0
    var H: Double = 0.0
    var R: Double = 0.0
    var lastTime: NSDate? = nil
    
    func initBPM() {
        X = 1        //Initial Duration between the taps
        P = 0.1      //Initial confidence in the measurements of the values of x
        Q = 0.00001  //Constant error: you know that you are often slow
        A = 1        // ------- might be important?
        H = 0.001    //How accurately we believe the instrument is measuring
        R = 0.0001   //Speed of response to variant
        lastTime = nil
    }
    
    @IBAction func bpmTap(sender: BMButton) {
        if lastTime?.timeIntervalSinceNow < -5.0 {
            initBPM()
        }
        let timeDiff = timeDifference()
        let calculation = correct(timeDiff)
        bpmDisplay.text = "\(Int(60.0 / calculation))"
    }
    
    func timeDifference() -> Double {
        let currentTime = NSDate()
        if lastTime == nil {
            lastTime = NSDate(timeIntervalSinceNow: -1)
        }
        let timeDiff = currentTime.timeIntervalSinceDate(lastTime!)
        lastTime = currentTime
        return timeDiff
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
}

