//
//  OrderItem.swift
//  SlantedDoorBackEnd
//
//  Created by Daniel Bacon on 10/9/19.
//  Copyright © 2019 Daniel Bacon. All rights reserved.
//

import Foundation


/// A base class to function as either a food or beverage item.
public class OrderItem {
    
    /// The item's name.
    private var _dishName: String!
    
    /// The price of the item.
    private var _price: Double!
    
    /// Flag if the item is on count.
    private var _itemSoldOut: Bool!
    
    /// The number of available items.
    private var _itemCount: Int!
    
    /// The list of ingredients.
    private var _ingredientList: [String]!
    
    
    var dishName: String {
        
        get {
            
            return _dishName
        }
        
        set {
            
            if !newValue.isEmpty {
                
                _dishName = newValue.capitalized
            }
        }
    }

    var price: Double {
        
        get {
            
            return _price
        }
        
        set {
            
            if newValue >= 0.0 {
                
                self._price = newValue
            }
        }
    }
    
    var itemSoldOut: Bool {
        
        get {
            
            return _itemSoldOut
        }
        
        set {
            
            _itemSoldOut = newValue
            
            if (newValue == true && itemCount != 0) {
                
                itemCount = 0
            }
            else if (newValue == false && itemCount == 0) {
                
                itemCount = -1
            }
        }
    }
    
    var itemCount: Int {
        
        get {
            
            return _itemCount
        }
        
        set {
            
            if newValue >= -1 {
                
                _itemCount = newValue
                
                if (newValue == 0 && itemSoldOut != true) {
                    
                    itemSoldOut = true
                }
                else if (newValue != 0 && itemSoldOut == true) {
                    
                    itemSoldOut = false
                }
            }
        }
    }
    
    var ingredientList: [String] {
        
        get {
            
            return _ingredientList
        }
    }
    
    
    /**
     Initializes a new item with the provided information.
     
     - Parameters:
     - dishName: The name of the item.
     - price: The price of the item.
     
     - Returns: A new item with given name and price, item count set to -1 and
     the item flagged as not being on count.
    */
    init(dishName: String, price: Double) {
        
        self._dishName = dishName.capitalized
        
        if price.sign == .minus {
            
            self._price = 0.00
        }
        else {
            
            self._price = price
        }
        
        self._itemSoldOut = false
        self._itemCount = -1
        self._ingredientList = []
    }
    
    
    /**
     Adds a new ingredient to the item's list of ingredients.
     
     - Parameter newIngredient: The new ingredient to add.
     - Precondition: `newIngredient` must not be an empty string.
    */
    func addIngredient(newIngredient: String) -> Void {
        
        if !newIngredient.isEmpty {
            
            if !_ingredientList.contains(newIngredient.lowercased()) {
                
                _ingredientList.append(newIngredient.lowercased())
            }
        }
    }
    
    
    /**
     Adds multiple new ingredients to the item's list of ingredients.
     
     - Parameter ingredientList: A list of new ingredients to add.
     - Precondition: `ingredientList` must not be empty.
    */
    func addIngredient(ingredientList: [String]) -> Void {
        
        if !ingredientList.isEmpty {
            
            for ingredient in ingredientList {
                
                addIngredient(newIngredient: ingredient)
            }
        }
    }
    
    
    /**
     Removes a given element from the item's list of ingredients.
     
     - Parameter toRemove: The ingredient to remove.
     - Precondition: `toRemove` is not an empty string.
     - Returns: The item removed from the ingredients list.
    */
    func removeIngredient(toRemove: String) -> String? {
        
        if !toRemove.isEmpty {
            
            if let indexToRemove = _ingredientList.firstIndex(of:
                toRemove.lowercased()) {
                
                return _ingredientList.remove(at: indexToRemove)
            }
        }
        
        return nil
    }
    
    
    /**
     Removes all ingredients from the item's ingredients list.
    */
    func clearIngredients() -> Void {
        
        _ingredientList.removeAll()
    }

    /**
     Displays items price as a dolar amount.
     
     - Returns: String format of price as $XX.XX
    */
    func displayPrice() -> String {
        
        return String(format: "$%.2f", price)
    }
}
