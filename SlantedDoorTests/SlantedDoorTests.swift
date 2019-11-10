//
//  SlantedDoorTests.swift
//  SlantedDoorTests
//
//  Created by Daniel Bacon on 11/1/18.
//  Copyright © 2018 Daniel Bacon. All rights reserved.
//

import XCTest
@testable import SlantedDoor

class SlantedDoorTests: XCTestCase {

    private var newItem: OrderItem!
    private var newFood: Food!
    private var newTable: Table!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        newItem = OrderItem(dishName: "new order item", price: 48.00)
        newFood = Food(dishName: "new food item", price: 35.00)
        newTable = Table(tableNumber: 99, guestCount: 4)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetSetOrderItem() {
        
        XCTAssertEqual(newItem.dishName, "New Order Item")
        XCTAssertEqual(newItem.price, 48.00)
        XCTAssertEqual(newItem.itemCount, -1)
        XCTAssertFalse(newItem.itemSoldOut)
        XCTAssertTrue(newItem.ingredientList.isEmpty)
        
        newItem.dishName = "Shaking beef"
        XCTAssertEqual(newItem.dishName, "Shaking Beef")
        
        newItem.dishName = ""
        XCTAssertNotEqual(newItem.dishName, "")
        
        newItem.price = 0.00
        XCTAssertEqual(newItem.price, 0.00)
        
        newItem.price = -15.00
        XCTAssertNotEqual(newItem.price, -15.00)
        
        newItem.price = 10
        XCTAssertEqual(newItem.price, 10.00)
        
        newItem.itemCount = 15
        XCTAssertEqual(newItem.itemCount, 15)
        XCTAssertFalse(newItem.itemSoldOut)
        
        newItem.itemCount = 0
        XCTAssertEqual(newItem.itemCount, 0)
        XCTAssertTrue(newItem.itemSoldOut)
        
        newItem.itemCount = -59
        XCTAssertNotEqual(newItem.itemCount, -59)
        XCTAssertTrue(newItem.itemSoldOut)
        
        newItem.itemCount = -1
        XCTAssertEqual(newItem.itemCount, -1)
        XCTAssertFalse(newItem.itemSoldOut)
        
        newItem.itemSoldOut = true
        XCTAssertTrue(newItem.itemSoldOut)
        XCTAssertEqual(newItem.itemCount, 0)
    }
    
    func testAddIngredient() {
        
        XCTAssertTrue(newItem.ingredientList.isEmpty)
        
        newItem.addIngredient(newIngredient: "new ingredient")
        XCTAssertFalse(newItem.ingredientList.isEmpty)
        XCTAssertTrue(newItem.ingredientList.count == 1)
        
        newItem.addIngredient(newIngredient: "")
        XCTAssertFalse(newItem.ingredientList.isEmpty)
        XCTAssertTrue(newItem.ingredientList.count == 1)
    }
    
    func testAddIngredientList() {
        
        XCTAssertTrue(newItem.ingredientList.isEmpty)

        let newIngredients = ["item1", "item2", "item3", "item4"]
        
        newItem.addIngredient(ingredientList: newIngredients)
        XCTAssertFalse(newItem.ingredientList.isEmpty)
        XCTAssertTrue(newItem.ingredientList.count == 4)
        
        let emptyIngredients : [String] = []
        
        newItem.addIngredient(ingredientList: emptyIngredients)
        XCTAssertFalse(newItem.ingredientList.isEmpty)
        XCTAssertTrue(newItem.ingredientList.count == 4)
    }
    
    func testRemoveIngredient() {
        
        XCTAssertTrue(newItem.ingredientList.isEmpty)
        
        let newIngredients = ["item1", "item2", "item3", "item4"]
        
        var removedItem = newItem.removeIngredient(toRemove: "")
        XCTAssertNil(removedItem)
        
        removedItem = newItem.removeIngredient(toRemove: "item3")
        XCTAssertNil(removedItem)
        
        newItem.addIngredient(ingredientList: newIngredients)
        XCTAssertFalse(newItem.ingredientList.isEmpty)
        
        removedItem = newItem.removeIngredient(toRemove: "item1")
        XCTAssertFalse(newItem.ingredientList.isEmpty)
        XCTAssertTrue(removedItem == "item1")
        XCTAssertTrue(newItem.ingredientList.count == 3)
    }
    
    func testClearIngredients() {
        
        XCTAssertTrue(newItem.ingredientList.isEmpty)
        
        let newIngredients = ["item1", "item2", "item3", "item4"]
        
        newItem.addIngredient(ingredientList: newIngredients)
        XCTAssertTrue(newItem.ingredientList.count == 4)
        
        newItem.clearIngredients()
        XCTAssertTrue(newItem.ingredientList.isEmpty)
    }
}
