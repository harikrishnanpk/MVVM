//
//  ObjectBinder.swift
//  hushPro
//
//  Created by harikrishnan on 03/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation

class ObjectBinder<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value:T {
        didSet{
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?)  {
        self.listener = listener
        listener?(value)
    }
}
