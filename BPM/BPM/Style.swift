//
//  Style.swift
//  BPM
//
//  Created by Brian Mitchell on 4/10/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import ChameleonFramework

// much help from http://sdbr.net/post/Themes-in-Swift/
struct Style {
    static var primary = UIColor.flatWhiteColor()
    static var isFlat = true
    static var colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    
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
    
    // MARK: Black Color Scheme
    static func themeBlack() {
        primary = UIColor.flatBlackColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
        colorArray[1] = primary.darkenByPercentage(0.1)
    }
    
    // MARK: Magenta Color Scheme
    static func themeMagenta() {
        primary = UIColor.flatMagentaColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
        colorArray[1] = primary.darkenByPercentage(0.15)
    }
    
    // MARK: Teal Color Scheme
    static func themeTeal() {
        primary = UIColor.flatTealColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Sky Blue Color Scheme
    static func themeSkyBlue() {
        primary = UIColor.flatSkyBlueColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Green Color Scheme
    static func themeGreen() {
        primary = UIColor.flatGreenColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Mint Color Scheme
    static func themeMint() {
        primary = UIColor.flatMintColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: White Color Scheme
    static func themeWhite() {
        primary = UIColor.flatWhiteColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
        colorArray[1] = primary.darkenByPercentage(0.15)
    }
    
    // MARK: Gray Color Scheme
    static func themeGray() {
        primary = UIColor.flatGrayColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Forest Green Color Scheme
    static func themeForestGreen() {
        primary = UIColor.flatForestGreenColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Purple Color Scheme
    static func themePurple() {
        primary = UIColor.flatPurpleColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Brown Color Scheme
    static func themeBrown() {
        primary = UIColor.flatBrownColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Plum Color Scheme
    static func themePlum() {
        primary = UIColor.flatPlumColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Watermelon Color Scheme
    static func themeWatermelon() {
        primary = UIColor.flatWatermelonColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Lime Color Scheme
    static func themeLime() {
        primary = UIColor.flatLimeColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Pink Color Scheme
    static func themePink() {
        primary = UIColor.flatPinkColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Maroon Color Scheme
    static func themeMaroon() {
        primary = UIColor.flatMaroonColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Coffee Color Scheme
    static func themeCoffee() {
        primary = UIColor.flatCoffeeColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Powder Blue Color Scheme
    static func themePowderBlue() {
        primary = UIColor.flatPowderBlueColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    // MARK: Blue Color Scheme
    static func themeBlue() {
        primary = UIColor.flatBlueColor()
        isFlat = true
        colorArray = ColorSchemeOf(ColorScheme.Analogous, color: primary, isFlatScheme: isFlat)
    }
    
    
    static let availableThemes = ["Red", "Orange", "Yellow", "Sand", "Navy Blue", "Black", "Magenta",
                                  "Teal", "Sky Blue", "Green", "Mint", "White", "Gray", "Forest Green",
                                  "Purple", "Brown", "Plum", "Watermelon", "Lime", "Pink", "Maroon",
                                  "Coffee", "Powder Blue", "Blue"]
    static func loadTheme() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let name = defaults.stringForKey("Theme") {
            // Select the Theme
            if name == "Red"          { themeRed()         }
            if name == "Orange"       { themeOrange()      }
            if name == "Yellow"       { themeYellow()      }
            if name == "Sand"         { themeSand()        }
            if name == "Navy Blue"    { themeNavyBlue()    }
            if name == "Black"        { themeBlack()	   }
            if name == "Magenta"      { themeMagenta()     }
            if name == "Teal"         { themeTeal()	       }
            if name == "Sky Blue"     { themeSkyBlue()     }
            if name == "Green"        { themeGreen()	   }
            if name == "Mint"         { themeMint()	       }
            if name == "White"        { themeWhite()	   }
            if name == "Gray"         { themeGray()	       }
            if name == "Forest Green" { themeForestGreen() }
            if name == "Purple"       { themePurple()	   }
            if name == "Brown"        { themeBrown()	   }
            if name == "Plum"         { themePlum()	       }
            if name == "Watermelon"   { themeWatermelon()  }
            if name == "Lime"         { themeLime()	       }
            if name == "Pink"         { themePink()	       }
            if name == "Maroon"       { themeMaroon()	   }
            if name == "Coffee"       { themeCoffee()	   }
            if name == "Powder Blue"  { themePowderBlue()  }
            if name == "Blue"         { themeBlue()	       }
        } else {
            defaults.setObject("White", forKey: "Theme")
            themeWhite()
        }
    }
}