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
    
    @IBOutlet weak var bpmDisplay: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var average: Double = 0
    var count = 0
    var lastTime: NSDate? = nil
    

    @IBAction func bpmTap(sender: UIButton) {
        let currentTime = NSDate()
        if count < 1 {
            lastTime = NSDate(timeIntervalSinceNow: -1)
        }
        let timeDiff = currentTime.timeIntervalSinceDate(lastTime!)
        let newAverage = calculateBPM(timeDiff, average: average, newCount: count)
        count += 1
        average = newAverage
        lastTime = currentTime
        bpmDisplay.text = "\(Int(average))"
    }
    
    func calculateBPM(timeDiff: NSTimeInterval, average: Double, newCount: Int) -> Double {
        if newCount > 2 {
            count = 1
        }
        return ((60/timeDiff) + Double(average) * Double(newCount)) / Double(newCount + 1)
    }
}

