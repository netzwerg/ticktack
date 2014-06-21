//
//  TickTackViewCell.swift
//  ticktack
//
//  Created by Rahel Lüthy on 20/06/14.
//  Copyright (c) 2014 Rahel Lüthy. All rights reserved.
//

import UIKit

class TickTackViewCell: UICollectionViewCell {
    
    @IBOutlet var label : UILabel
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        println("ViewCell init")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.whiteColor()
        contentView.opaque = false
        contentView.alpha = 0.5
    }

}
