//
//  User.swift
//  hushPro
//
//  Created by harikrishnan on 25/06/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation

struct User: Codable {
    var email:String
    var password:String
    
    init() {
        self.email = ""
        self.password = ""
    }
}
