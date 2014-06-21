//
//  TickTackModelTest.swift
//  ticktack
//
//  Created by Rahel Lüthy on 20/06/14.
//  Copyright (c) 2014 Rahel Lüthy. All rights reserved.
//

import Foundation
import XCTest
import ticktack

class TickTackModelTest: XCTestCase {
    
    let model = TickTackModel()
    
    func testItems() {
        print(model.items.count)
        XCTAssert(model.items.count == 10, "Model initially contains 10 items")
    }
    
}


