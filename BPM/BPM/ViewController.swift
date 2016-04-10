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
    var loadTheme: Bool = {
        Style.loadTheme()
        return true
    }()
    var isLight = true
    
    @IBOutlet weak var bpmDisplay: UILabel!
    @IBOutlet weak var bpmTap: BMButton!

    @IBAction func changeTheme(sender: AnyObject) {
        if (isLight) {
            Style.themeDark()
            isLight = false
        } else {
            Style.themeLight()
            isLight = true
        }
        
        self.view.backgroundColor = Style.backgroundColor
        bpmDisplay.textColor = Style.bpmDisplayFontColor
        bpmDisplay.font = Style.bpmDisplayFont
        bpmTap.titleLabel?.font = Style.bpmTapFont
        bpmTap.tintColor = Style.bpmTapFontColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set theme
        self.view.backgroundColor = Style.backgroundColor
        bpmDisplay.textColor = Style.bpmDisplayFontColor
        bpmDisplay.font = Style.bpmDisplayFont
        bpmTap.titleLabel?.font = Style.bpmTapFont
        bpmTap.tintColor = Style.bpmTapFontColor //might not be working
//        bpmTap. = Style.bpmTapColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    var X: Double = 1        //Initial Duration between the taps
    var P: Double = 0.1      //Initial confidence in the measurements of the values of x
    var Q: Double = 0.00001  //Constant error: you know that you are often slow
    var A: Double = 1        // ------- might be important?
    var H: Double = 0.001    //How accurately we believe the instrument is measuring
    var R: Double = 0.0001   //Speed of response to variant

    var lastTime: NSDate? = nil
    
    @IBAction func bpmTap(sender: BMButton) {
        let timeDiff = timeDifference()
        let calculation = correct(timeDiff)
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

}

