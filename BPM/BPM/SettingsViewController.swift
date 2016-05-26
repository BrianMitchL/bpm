//
//  SettingsViewController.swift
//  BPM
//
//  Created by Brian Mitchell on 5/26/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBAction func done(sender: UIStoryboardSegue) {
        print("done")
        self.dismissViewControllerAnimated(true, completion: {})
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
