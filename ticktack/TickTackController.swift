//
//  TickTackController.swift
//  ticktack
//
//  Created by Rahel Lüthy on 20/06/14.
//  Copyright (c) 2014 Rahel Lüthy. All rights reserved.
//

import UIKit

class TickTackController: UINavigationController {
    
    let model = TickTackModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.restorationIdentifier = "TickTackController_restorationIdentifier"
        pushViewController(TickTackViewController(model: model), animated: false)
    }
    
    func saveState(coder: NSCoder) {
        println("TickTackController.saveState")
        model.saveState(coder)
    }
    
    func restoreState(decoder: NSCoder) {
        model.restoreState(decoder)
    }
    
    class TickTackViewController: UICollectionViewController {
        
        let columnCount = 2
        let rowCount = 5
        let cellId = TickTackViewCell.description()!
        var model: TickTackModel
        
        init(model: TickTackModel) {
            self.model = model
            super.init(collectionViewLayout: TickTackLayout())
            println("CollectionViewController init")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            var nibName = UINib(nibName: "TickTackViewCell", bundle: nil)
            collectionView.registerNib(nibName, forCellWithReuseIdentifier: cellId)
            collectionView.backgroundColor = UIColor.grayColor()
            collectionView.allowsMultipleSelection = true
        }
        
        override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
            return columnCount
        }
        
        override func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
            return rowCount
        }
        
        func pathToIndex(path: NSIndexPath) -> Int {
            var rowIndex = path.section
            var colIndex = path.item
            return (rowIndex * columnCount) + colIndex
        }
        
        override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
            
            var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as TickTackViewCell

            var itemIndex = pathToIndex(indexPath)
            cell.contentView.backgroundColor = ColorController.colorForIndex(itemIndex, selected: cell.selected)

            cell.modelItem = model.items[itemIndex]
            
            return cell
        }
        
        override func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
            updateSelectionState(collectionView, indexPath: indexPath)
        }
        
        override func collectionView(collectionView: UICollectionView!, didDeselectItemAtIndexPath indexPath: NSIndexPath!) {
            updateSelectionState(collectionView, indexPath: indexPath)
        }
        
        func updateSelectionState(collectionView: UICollectionView!, indexPath: NSIndexPath!) {
            var cell = collectionView.cellForItemAtIndexPath(indexPath) as TickTackViewCell
            var itemIndex = pathToIndex(indexPath)
            cell.modelItem?.toggleCompleted()
            cell.contentView.backgroundColor = ColorController.colorForIndex(itemIndex, selected: cell.selected)
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