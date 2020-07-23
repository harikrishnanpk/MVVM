//
//  BoolEnum.swift
//  hushPro
//
//  Created by harikrishnan on 23/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation

enum BoolEnum {
    /// Bool have only we values, so declared on and off cases here.
    case on
    case off
    
    /// isOn and isOff varaibles for getting is on and off
    var isOn: Bool {
        self == .on
    }
    var isOff: Bool {
        self == .off
    }
    /// switchType method we can use to switch current value into another value
    mutating func switchType() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
    
    /// currentValue will give what is the current value.
    var currentValue : Bool {
        switch self {
        case .on:
            return true
        case .off:
            return false
        }
    }
}
