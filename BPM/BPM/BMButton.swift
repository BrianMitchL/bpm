//
//  BMButton.swift
//  BPM
//
//  Created by Brian Mitchell on 4/9/16.
//  Copyright © 2016 Brian Mitchell. All rights reserved.
//

import Foundation
import UIKit

class BMButton: UIButton {
    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(ovalInRect: rect)
        UIColor.greenColor().setFill()
        path.fill()
    }
}