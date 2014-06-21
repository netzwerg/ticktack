//
//  TickTackController.swift
//  ticktack
//
//  Created by Rahel Lüthy on 20/06/14.
//  Copyright (c) 2014 Rahel Lüthy. All rights reserved.
//

import UIKit

class TickTackController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pushViewController(TickTackViewController(), animated: false)
    }
    
    class TickTackViewController: UICollectionViewController {
        
        let cellId = TickTackViewCell.description()!
        let model = TickTackModel()
        
        init() {
            super.init(collectionViewLayout: TickTackLayout())
            println("CollectionViewController init")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            var nibName = UINib(nibName: "TickTackViewCell", bundle: nil)
            collectionView.registerNib(nibName, forCellWithReuseIdentifier: cellId)
            collectionView.backgroundColor = UIColor.grayColor()
        }
        
        override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
            return 2
        }
        
        override func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
            return 5
        }
        
        override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
            println("Cell construction")
            
            var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as TickTackViewCell

            var rowIndex = indexPath.section
            var colIndex = indexPath.item
            var itemIndex = (rowIndex * 2) + colIndex
            
            var highlighted = [0,3,4,7,8]
            if (contains(highlighted, itemIndex)) {
                cell.contentView.backgroundColor = UIColor.blueColor()
            }

            cell.label.text = model.items[itemIndex].itemName

            return cell
        }
        
    }
    
    class TickTackLayout: UICollectionViewFlowLayout {
        
        init() {
            super.init()
            sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            estimatedItemSize = CGSizeMake(160, 100)
            minimumLineSpacing = 0
            minimumInteritemSpacing = 0

        }
        
    }
    
}