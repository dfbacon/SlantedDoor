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
    private var newBev: Beverage!
    private var newTable: Table!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        newItem = OrderItem(dishName: "new order item", price: 48.00)
        newFood = Food(dishName: "new food item", price: 35.00)
        newBev = Beverage(dishName: "new beverage", price: 15.00)
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
    
    /// OrderItem model tests
    
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
    
    func testAddIngredients() {
        
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
    
    func testDisplayPrice() {
        
        XCTAssertTrue(newItem.ingredientList.isEmpty)
        
        XCTAssertEqual(newItem.displayPrice(), "$48.00")
        XCTAssertNotEqual("$\(newItem.price)", newItem.displayPrice())
    }
    
    /// Food model tests
    
    func testAddAllergen() {
        
        XCTAssertTrue(newFood.allergyList.isEmpty)
        
        newFood.addNewAllergen(newAllergen: "New Allergen")
        XCTAssertFalse(newFood.allergyList.isEmpty)
        XCTAssertEqual(newFood.allergyList[0], "new allergen")
    }
    
    func testAddAllergens() {
        
        XCTAssertTrue(newFood.allergyList.isEmpty)
        
        let allergenList = ["allergen1", "allergen2", "allergen3", "allergen4"]
        
        newFood.addNewAllergen(allergenList: allergenList)
        XCTAssertFalse(newFood.allergyList.isEmpty)
        XCTAssertTrue(newFood.allergyList.count == 4)
        XCTAssertEqual(newFood.allergyList[0], "allergen1")
    }
    
    /// Beverage model tests
    
    func testBeverageIsLiquor() {
        
        XCTAssertFalse(newBev.isLiquor)
        
        newBev.isLiquor = true
        XCTAssertTrue(newBev.isLiquor)
    }
    
    /// Table model tests
    
    func testTableGetSet() {
        
        XCTAssertTrue(newTable.tableNumber == 99)
        newTable.tableNumber = 100
        newTable.tableNumber = -1
        XCTAssertFalse(newTable.tableNumber == -1)
        XCTAssertTrue(newTable.tableNumber == 100)
        
        XCTAssertTrue(newTable.guestCount == 4)
        newTable.guestCount = 3
        newTable.guestCount = -3
        XCTAssertFalse(newTable.guestCount == -3)
        XCTAssertTrue(newTable.guestCount == 3)
        
        XCTAssertTrue(newTable.currentStatus == "Seated")
        newTable.currentStatus = "entree"
        newTable.currentStatus = ""
        XCTAssertFalse(newTable.currentStatus == "")
        XCTAssertFalse(newTable.currentStatus == "entree")
        XCTAssertTrue(newTable.currentStatus == "Entree")
        
        XCTAssertNotNil(newTable.timeCreated)
    }
    
    func testElapsedTime() {
        XCTAssertNotNil(newTable.timeCreated)
        
        sleep(65)
        
        XCTAssertEqual(newTable.elapsedTime(), "00:01:05")
    }
}
