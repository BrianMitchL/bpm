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
    static var backgroundColor = UIColor(hue:0, saturation:0, brightness:0.98, alpha:1)
    static var statusbarStyle = UIStatusBarStyle.Default
    static var bpmDisplayFontColor = UIColor.darkGrayColor()
    static var bpmDisplayFont = UIFont.systemFontOfSize(72)
    static var bpmTapFont = UIFont.systemFontOfSize(32)
    static var bpmTapFontColor = UIColor(hue:0, saturation:0, brightness:0.137, alpha:1)
    static var bpmTapBackgroundColor = UIColor(hue:0, saturation:0, brightness:0.1, alpha:0.25)
    static var bpmTapRippleColor = UIColor(hue: 0.0, saturation: 0.0, brightness: 0.8, alpha: 0.5)
    static var bpmTapColor = UIColor(hue:0, saturation:0, brightness:0.8, alpha:0.5)
    
    
    // MARK: Light Color Scheme
    static func themeLight() {
        backgroundColor = UIColor(hue:0, saturation:0, brightness:0.98, alpha:1)
        statusbarStyle = UIStatusBarStyle.Default
        bpmDisplayFontColor = UIColor.darkGrayColor()
        bpmDisplayFont = UIFont.systemFontOfSize(72)
        bpmTapFont = UIFont.systemFontOfSize(32)
        bpmTapFontColor = UIColor(hue:0, saturation:0, brightness:0.137, alpha:1)
        bpmTapBackgroundColor = UIColor(hue:0, saturation:0, brightness:0.1, alpha:0.25)
        bpmTapRippleColor = UIColor(hue: 0, saturation: 0, brightness: 0.8, alpha: 0.5)
        bpmTapColor = UIColor(hue:0, saturation:0, brightness:0.8, alpha:0.5)
    }
    
    // MARK: Dark Color Scheme
    static func themeDark() {
        backgroundColor = UIColor(hue:0, saturation:0, brightness:0.1, alpha:1)
        statusbarStyle = UIStatusBarStyle.LightContent
        bpmDisplayFontColor = UIColor.lightGrayColor()
        bpmDisplayFont = UIFont.systemFontOfSize(72)
        bpmTapFont = UIFont.systemFontOfSize(32)
        bpmTapFontColor = UIColor.lightGrayColor()
        bpmTapBackgroundColor = UIColor(hue:0, saturation:0, brightness:0.9, alpha:0.25)
        bpmTapRippleColor = UIColor(hue: 0, saturation: 0, brightness: 0.2, alpha: 0.5)
        bpmTapColor = UIColor(hue:0, saturation:0, brightness:0.2, alpha:0.5)
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