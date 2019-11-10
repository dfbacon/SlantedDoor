//
//  Table.swift
//  SlantedDoorBackEnd
//
//  Created by Daniel Bacon on 10/2/19.
//  Copyright © 2019 Daniel Bacon. All rights reserved.
//

import Foundation

/// A class that functions as a table.
public class Table {
    
    /// The number to identify the table.
    private var _tableNumber: Int!
    
    /// The number of guests seated at the table.
    private var _guestCount: Int!
    
    /// The status of the table.
    private var _currentStatus: String!
    
    /// The time the table was sat with it's current occupants.
    private let _timeCreated: Date!
    
    
    var tableNumber: Int {
        get {
            return _tableNumber
        }
        
        set {
            if newValue >= 0 {
                _tableNumber = newValue
            }
        }
    }
    
    var guestCount: Int {
        get {
            return _guestCount
        }
        
        set {
            if newValue >= 0 {
                _guestCount = newValue
            }
        }
    }
    
    var currentStatus: String {
        get {
            return _currentStatus
        }
        
        set {
            if !newValue.isEmpty {
                _currentStatus = newValue
            }
        }
    }
    
    var timeCreated: Date {
        return _timeCreated
    }
    
    
    /**
     Initializes a new table with the following data items.
     
     - Parameters:
     - tableNumber: The table's identifying number.
     - guestCount: The number of guests to be seated at the table.
     
     - Returns: New table with the given table number and guest count, the
     timestamp for its creation and the table's status set to "Seated".
    */
    init(tableNumber: Int, guestCount: Int) {
        self._tableNumber = tableNumber
        self._guestCount = guestCount
        self._timeCreated = Date()
        self._currentStatus = "Seated"
    }

    
    
    /**
     Determines the amount of time a table has been active. Displays this time
     as HH:MM:SS.
     
     - Returns: Formatted string of the amount of time the table has been active.
    */
    func elapsedTime() -> String {
        let seconds = Int(_timeCreated.timeIntervalSinceNow * -1)
        
        if seconds > 59 {
            let minuteString = String(format: "%02d", (seconds % 3600) / 60)
            let hourString = String(format: "%02d", seconds / 3600)
            let secondString = String(format: "%02d", (seconds % 3600) % 60)

            return "\(hourString):\(minuteString):\(secondString)"
        }
        else {
            let secondString = String(format: "%02d", seconds)
            
            return "00:00:\(secondString)"
        }
    }
}
