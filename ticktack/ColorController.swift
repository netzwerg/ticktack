//
//  ColorController.swift
//  ticktack
//
//  Created by Rahel Lüthy on 24/06/14.
//  Copyright (c) 2014 Rahel Lüthy. All rights reserved.
//

import Foundation
import UIKit

class ColorController {
    
    class func colorForIndex(index: Int, selected: Bool) -> UIColor {
        if (selected) {
            return UIColor.whiteColor()
        }
        else if (contains([0,3,4,7,8], index)) {
            return UIColor.blueColor()
        } else {
            return UIColor.redColor()
        }
    }

}
