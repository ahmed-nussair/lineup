//
//  BackButton.swift
//  Runner
//
//  Created by Ahmed Nussair on 8/14/20.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import UIKit

class BackButton:UIButton {
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ?
                UIColor(red: 201 / 255, green: 62 / 255, blue: 0 / 255, alpha: 1.0) :
                UIColor(red: 252 / 255, green: 85 / 255, blue: 10 / 255, alpha: 1.0)
        }
    }
}
