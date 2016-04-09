//
//  ViewController.swift
//  BPM
//
//  Created by Brian Mitchell and Zach Litzinger on 4/8/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import UIKit

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
    
    let timeout = 3
    var average = 0
    var weight = 0
    var lastTime = NSDate()
    

    @IBAction func bpmTap(sender: UIButton) {
        let currentTime = NSDate()
        var (newAverage, newWeight) = calculateBPM(currentTime, lastTime: lastTime, average: average, weight: weight)
        weight = newWeight
        average = newAverage
        lastTime = currentTime
        bpmDisplay.text = "\(average)"
    }
    
    func calculateBPM(currentTime: NSDate, lastTime: NSDate, average: Int, weight: Int) -> (newAverage: Int, newWeight: Int) {
        return (128, 1)
    }
}

