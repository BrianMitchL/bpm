//
//  SettingsViewController.swift
//  BPM
//
//  Created by Brian Mitchell on 5/26/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var loadTheme: Bool = {
        Style.loadTheme()
        return true
    }()

    @IBAction func done(sender: UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    @IBAction func heart(sender: AnyObject) {
        let text: String = "Check out BPM - Find Tempos in Style!"
        let url = NSURL(string: "https://brianm.me")
        let activityVC = UIActivityViewController(activityItems: [text, url!], applicationActivities: nil)
        
        self.presentViewController(activityVC, animated: true, completion: nil)

    }
    
    @IBOutlet weak var themes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTheme()
        self.themes.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Style.availableThemes.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.themes.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = Style.availableThemes[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if Style.availableThemes[indexPath.row] == defaults.stringForKey("Theme") {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .None) //autoselect the checked theme
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        let selection = Style.availableThemes[indexPath.row]
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(selection, forKey: "Theme")
        Style.loadTheme()
        updateTheme()
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.accessoryType = UITableViewCellAccessoryType.None
    }

    
    func updateTheme() {
        self.view.backgroundColor = Style.backgroundColor
        UIApplication.sharedApplication().statusBarStyle = Style.statusbarStyle
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
