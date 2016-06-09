//
//  MainViewController.swift
//  BPM
//
//  Created by Brian Mitchell and Zach Litzinger on 4/8/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import UIKit
import Foundation
import ChameleonFramework
import FontAwesome_swift

class MainViewController: UIViewController {
    var loadTheme: Bool = {
        Style.loadTheme()
        return true
    }()
    
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var bpmDisplay: UILabel!
    @IBOutlet weak var bpmTap: BMButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings.titleLabel?.font = UIFont.fontAwesomeOfSize(30)
        settings.setTitle(String.fontAwesomeIconWithName(.Cog), forState: .Normal)
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
        self.setStatusBarStyle(UIStatusBarStyleContrast)
        self.view.backgroundColor = Style.colorArray[2]
        bpmDisplay.textColor = UIColor(contrastingBlackOrWhiteColorOn:Style.colorArray[2], isFlat:Style.isFlat)
        bpmTap.setTitleColor(UIColor(contrastingBlackOrWhiteColorOn:Style.colorArray[2], isFlat:Style.isFlat), forState: UIControlState.Normal)
        bpmTap.strokeColor = Style.colorArray[1].colorWithAlphaComponent(0.25)
        bpmTap.rippleColor = Style.colorArray[1].colorWithAlphaComponent(0.33)
        self.view.tintColor = UIColor(contrastingBlackOrWhiteColorOn:Style.colorArray[2], isFlat:Style.isFlat)
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

