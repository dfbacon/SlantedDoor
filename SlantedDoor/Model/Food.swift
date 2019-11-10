//
//  Food.swift
//  SlantedDoorBackEnd
//
//  Created by Daniel Bacon on 10/2/19.
//  Copyright © 2019 Daniel Bacon. All rights reserved.
//

import Foundation

/// A class to function as a food item.
public class Food : OrderItem {
    
    /// List of allergens in the dish.
    private var _allergyList: [String]!;
    
    var allergyList: [String] {
        
        return _allergyList
    }
    
    override init(dishName: String, price: Double) {
        
        super.init(dishName: dishName, price: price)
        self._allergyList = []
    }
    
    
    /**
     Adds a new allergen to the list of allergens.
     
     - Parameter newAllergen: The new allergen to add to the allergen list.
     - Precondition: `newAllergen` must not be an empty string.
    */
    func addNewAllergen(newAllergen: String) -> Void {
        
        if !newAllergen.isEmpty {
        
            if !allergyList.contains(newAllergen.lowercased()) {
            
                _allergyList.append(newAllergen.lowercased())
            }
        }
    }
    
    
    /**
     Adds multiple new allergens to the list of allergens.
     
     - Parameter allergenList: List of allergens to add.
     - Precondition: `allergenList` must not be an empty array.
    */
    func addNewAllergen(allergenList: [String]) -> Void {
        
        if !allergenList.isEmpty {
        
            for entry in allergenList {
            
                addNewAllergen(newAllergen: entry)
            }
        }
    }
    
    
    /**
     Removes a specific allergen from the allergen list.
     
     - Parameter toRemove: The allergen to remove.
     - Precondition:
     - `toRemove` must not be an empty string.
     - The list of allergens must exist.
     
     - Returns: The removed allergen if it exists in the allergen list,
     otherwise nil.
    */
    func removeAllergen(toRemove: String) -> String? {
        
        if !allergyList.isEmpty && !toRemove.isEmpty {
        
            if let indexToRemove = allergyList.firstIndex(of:
                toRemove.lowercased()) {
                
                return _allergyList.remove(at: indexToRemove)
            }
        }
        
        return nil
    }
    
    
    /**
     Removes all items from the list of allergens.
    */
    func clearAllergens() -> Void {
        
        if !allergyList.isEmpty{
        
            _allergyList.removeAll()
        }
    }
}
