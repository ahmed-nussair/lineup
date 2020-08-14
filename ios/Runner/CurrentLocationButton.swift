//
//  CurrentLocationButton.swift
//  Runner
//
//  Created by Ahmed Nussair on 8/14/20.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import UIKit

class CurrentLocationButton: UIButton {
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.gray : UIColor(white: 1, alpha: 0.5)
        }
    }
}
