//
//  SettingsViewController.swift
//  BPM
//
//  Created by Brian Mitchell on 5/26/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import UIKit
import ChameleonFramework

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var selection: String!
    
    var loadTheme: Bool = {
        Style.loadTheme()
        return true
    }()

    @IBAction func done(sender: UIStoryboardSegue) {
        Style.loadTheme()
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    @IBOutlet weak var heart: UIBarButtonItem!
    @IBAction func heart(sender: AnyObject) {
        let text: String = "Check out BPM - Find Tempos in Style!"
        let url = NSURL(string: "https://getbpm.xyz")
        let activityVC = UIActivityViewController(activityItems: [text, url!], applicationActivities: nil)
        
        self.presentViewController(activityVC, animated: true, completion: nil)

    }
    
    @IBOutlet weak var themes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
        heart.setTitleTextAttributes(attributes, forState: .Normal)
        heart.title = String.fontAwesomeIconWithName(.Heart)
        selection = defaults.stringForKey("Theme")
        updateTheme()
        self.themes.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    //Fill TableView
//    
//    let sections = ["Developers", "Themes", "Acknowledgements"]
//    let developers = ["Brian Mitchell", "Zach Litzinger"]
//    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//        return self.sections[section]
//    }
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        
//        return self.sections.count
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Style.availableThemes.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.themes.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = Style.availableThemes[indexPath.row]
        cell.textLabel?.textColor = UIColor(contrastingBlackOrWhiteColorOn:Style.colorArray[2], isFlat:Style.isFlat)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.accessoryType = UITableViewCellAccessoryType.None
        cell.selected = false
        if Style.availableThemes[indexPath.row] == defaults.stringForKey("Theme") {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .None) //autoselect the checked theme
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Selected")
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        selection = Style.availableThemes[indexPath.row]
        defaults.setObject(selection, forKey: "Theme")
//        updateTheme()
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
    }

    
    func updateTheme() {
        self.setStatusBarStyle(UIStatusBarStyleContrast)
        self.view.backgroundColor = Style.colorArray[2]
        self.view.tintColor = UIColor(contrastingBlackOrWhiteColorOn:Style.colorArray[2], isFlat:Style.isFlat)
        self.themes.backgroundColor = Style.colorArray[2]
        self.themes.separatorColor = Style.colorArray[1]
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor(contrastingBlackOrWhiteColorOn:Style.colorArray[2], isFlat:Style.isFlat)]
        UINavigationBar.appearance().barTintColor = Style.colorArray[2]
        UINavigationBar.appearance().tintColor = UIColor(contrastingBlackOrWhiteColorOn:Style.colorArray[2], isFlat:Style.isFlat)
        UITableView.appearance().tintColor = UIColor(contrastingBlackOrWhiteColorOn:Style.colorArray[2], isFlat:Style.isFlat)
        UITableViewCell.appearance().backgroundColor = Style.colorArray[3]
        UITableViewCell.appearance().tintColor = UIColor(contrastingBlackOrWhiteColorOn:Style.colorArray[2], isFlat:Style.isFlat)
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
