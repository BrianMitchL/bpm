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
    static var backgroundColor = UIColor.init(hue:0, saturation:0, brightness:0.975, alpha:1)
    static var bpmDisplayFontColor = UIColor.darkGrayColor()
    static var bpmDisplayFont = UIFont.systemFontOfSize(72)
    static var bpmTapFont = UIFont.systemFontOfSize(32)
    static var bpmTapFontColor = UIColor.init(hue:0, saturation:0, brightness:0.137, alpha:1)
    static var bpmTapColor = UIColor.init(hue:0, saturation:0, brightness:0.1, alpha:0.25)
    static var bpmTapRippleColor = UIColor.init(hue: 0.0, saturation: 0.0, brightness: 0.8, alpha: 0.5)
    
    
    // MARK: Light Color Scheme
    static func themeLight() {
        backgroundColor = UIColor.init(hue:0.1, saturation:1, brightness:0.975, alpha:1)
        bpmDisplayFontColor = UIColor.redColor()
        bpmDisplayFont = UIFont.systemFontOfSize(48)
        bpmTapFont = UIFont.systemFontOfSize(36)
        bpmTapFontColor = UIColor.init(hue:0.5, saturation:1, brightness:0.137, alpha:1)
        bpmTapColor = UIColor.init(hue:0.2, saturation:1, brightness:0.1, alpha:0.25)
        bpmTapRippleColor = UIColor.init(hue: 0.7, saturation: 1, brightness: 0.8, alpha: 0.5)
    }
    
    // MARK: Dark Color Scheme
    static func themeDark() {
        backgroundColor = UIColor.init(hue:0.0, saturation:0, brightness:0.0, alpha:1)
        bpmDisplayFontColor = UIColor.redColor()
        bpmDisplayFont = UIFont.systemFontOfSize(48)
        bpmTapFont = UIFont.systemFontOfSize(36)
        bpmTapFontColor = UIColor.init(hue:0.5, saturation:1, brightness:0.137, alpha:1)
        bpmTapColor = UIColor.init(hue:0.2, saturation:1, brightness:0.1, alpha:0.25)
        bpmTapRippleColor = UIColor.init(hue: 0.7, saturation: 1, brightness: 0.8, alpha: 0.5)
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