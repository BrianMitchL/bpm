//
//  Style.swift
//  BPM
//
//  Created by Brian Mitchell on 4/10/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import Foundation
import UIKit

// much help from http://sdbr.net/post/Themes-in-Swift/
struct Style {
    static var bpmDisplayFontColor = UIColor.darkGrayColor()
    static var bpmDisplayFont = UIFont.systemFontOfSize(32)
    static var bpmTapFont = UIFont.systemFontOfSize(72)
    static var bpmTapFontColor = UIColor.init(hue:0, saturation:0, brightness:0.137, alpha:1)
    static var bpmTapColor = UIColor.init(hue:0, saturation:0, brightness:0.1, alpha:1)
    static var bpmTapRippleColor = UIColor.init(hue: 0.0, saturation: 0.0, brightness: 0.8, alpha: 0.5)
//    static var ViewController.view.backgroundColor = UIColor()
    
    
    // MARK: Light Color Scheme
    static func themeLight() {
        bpmDisplayFontColor = UIColor.darkGrayColor()
        bpmDisplayFont = UIFont.systemFontOfSize(32)
        bpmTapFont = UIFont.systemFontOfSize(72)
        bpmTapFontColor = UIColor.darkGrayColor()
        bpmTapColor = UIColor.grayColor()
        bpmTapRippleColor = UIColor.init(hue: 0.0, saturation: 0.0, brightness: 0.8, alpha: 0.5)
    }
    
    // MARK: Dark Color Scheme
    static func themeDark() {
//        sectionHeaderTitleFont = UIFont(name: "Helvetica", size: 18)
//        sectionHeaderTitleColor = UIColor.whiteColor()
//        sectionHeaderBackgroundColor = UIColor.blueColor()
//        sectionHeaderBackgroundColorHighlighted = UIColor.lightGrayColor()
//        sectionHeaderAlpha: CGFloat = 0.8
    }
    
    
    static let availableThemes = ["Light", "Dark"]
    static func loadTheme() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let name = defaults.stringForKey("Theme") {
            // Select the Theme
            if name == "Light"		{ themeLight()	}
            if name == "Dark"       { themeDark()	}
        } else {
            defaults.setObject("Light", forKey: "Theme")
            themeLight()
        }
    }
}