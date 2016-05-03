//
//  MenuViewController.swift
//  BPM
//
//  Created by ZachHacks on 4/9/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UITableViewCell {
    @IBOutlet weak var MenuLabel: UILabel!
    @IBOutlet weak var MenuSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated:animated)
    
    // Configure the view for the selected state
    }
}