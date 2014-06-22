//
//  TickTackViewCell.swift
//  ticktack
//
//  Created by Rahel Lüthy on 20/06/14.
//  Copyright (c) 2014 Rahel Lüthy. All rights reserved.
//

import UIKit

class TickTackViewCell: UICollectionViewCell {
    
    @IBOutlet var label: UILabel
    
    var controller: TickTackController.TickTackViewController?
    var modelItem: TickTackModel.TickTackItem? {
        get {
            return self.modelItem
        }
        set(newItem) {
            label.text = newItem?.itemName
        }
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        println("ViewCell init")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor.redColor()
        contentView.opaque = false
        contentView.alpha = 0.5
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "cellTapped:")
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        self.addGestureRecognizer(tapGesture)
    }
    
    func cellTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if tapGestureRecognizer.state == .Ended {
            controller?.cellTapped(self)
        }
    }

}
