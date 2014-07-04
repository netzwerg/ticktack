//
//  TickTackModel.swift
//  ticktack
//
//  Created by Rahel Lüthy on 20/06/14.
//  Copyright (c) 2014 Rahel Lüthy. All rights reserved.
//

import Foundation

class TickTackModel {
    
    let items = Array(map(0 .. 10, {
        (i: Int) -> TickTackItem in return TickTackItem(itemName: String(i))
    }))
    
    class TickTackItem {
        
        var itemName: String
        var completed: Bool
        
        init(itemName: String){
            self.itemName = itemName
            self.completed = false
        }
        
        func toggleCompleted() {
            completed = !completed
            println("Model " + itemName + ", completed " + String(completed))
        }
        
    }
    
    func saveState(aCoder: NSCoder!) {
        println("TickTackModel.saveState")
        for item in items {
            aCoder!.encodeBool(item.completed, forKey: item.itemName)
        }
    }
    
    func restoreState(aDecoder: NSCoder!) {
        println("TickTackModel.restoreState")
        for item in items {
            item.completed = aDecoder!.decodeBoolForKey(item.itemName)
            println("Item" + item.itemName + " restored as " + String(item.completed))
        }
    }

    
}