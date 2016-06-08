//
//  Style.swift
//  BPM
//
//  Created by Brian Mitchell on 4/10/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

// much help from http://sdbr.net/post/Themes-in-Swift/
struct Style {
    static var primary = UIColor.flatWhiteColor()
    static var isFlat = true
    static var colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    
    // MARK: White Color Scheme
    static func themeWhite() {
        primary = UIColor.flatWhiteColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
        colorArray[1] = primary.darkenByPercentage(0.15)
    }
    
    // MARK: Black Color Scheme
    static func themeBlack() {
        primary = UIColor.flatBlackColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
        colorArray[1] = primary.darkenByPercentage(0.1)
    }
    
    // MARK: Red Color Scheme
    static func themeRed() {
        primary = UIColor.flatRedColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
        colorArray[3] = colorArray[3].lightenByPercentage(0.1)
    }
    
    // MARK: Orange Color Scheme
    static func themeOrange() {
        primary = UIColor.flatOrangeColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
        colorArray[3] = colorArray[3].darkenByPercentage(0.1)
    }
    
    // MARK: Yellow Color Scheme
    static func themeYellow() {
        primary = UIColor.flatYellowColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
        colorArray[3] = primary.darkenByPercentage(0.1)
    }
    
    // MARK: Sand Color Scheme
    static func themeSand() {
        primary = UIColor.flatSandColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Navy Blue Color Scheme
    static func themeNavyBlue() {
        primary = UIColor.flatNavyBlueColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Magenta Color Scheme
    static func themeMagenta() {
        primary = UIColor.flatMagentaColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
        colorArray[1] = primary.darkenByPercentage(0.15)
    }
    
    
    static let availableThemes = ["White", "Black", "Red", "Orange", "Yellow", "Sand", "Navy Blue", "Magenta"]
    static func loadTheme() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let name = defaults.stringForKey("Theme") {
            // Select the Theme
            if name == "White"      { themeWhite()	  }
            if name == "Black"      { themeBlack()	  }
            if name == "Red"        { themeRed()      }
            if name == "Orange"     { themeOrange()   }
            if name == "Yellow"     { themeYellow()   }
            if name == "Sand"       { themeSand()     }
            if name == "Navy Blue"  { themeNavyBlue() }
            if name == "Magenta"    { themeMagenta()  }
        } else {
            defaults.setObject("White", forKey: "Theme")
            themeWhite()
        }
    }
}