//
//  Beverage.swift
//  SlantedDoorBackEnd
//
//  Created by Daniel Bacon on 10/10/19.
//  Copyright © 2019 Daniel Bacon. All rights reserved.
//

import Foundation

/// A class that functions as a beverage item.
public class Beverage : OrderItem {
    
    /// Flag to check if the beverage contains alcohol.
    private var _isLiquor: Bool!
    
    override init(dishName: String, price: Double) {
        
        super.init(dishName: dishName, price: price)
        self._isLiquor = false;
    }

    var isLiquor: Bool {
        
        get {
            
            return _isLiquor
        }
        
        set {
            
            self._isLiquor = newValue
        }
    }
}
