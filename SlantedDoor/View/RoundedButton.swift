//
//  RoundedButton.swift
//  SlantedDoor
//
//  Created by Daniel Bacon on 11/9/19.
//  Copyright © 2019 Daniel Bacon. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }

}
