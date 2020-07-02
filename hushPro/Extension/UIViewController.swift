//
//  UIViewController.swift
//  hushPro
//
//  Created by harikrishnan on 26/06/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiate(from: AppStoryBoard) -> Self{
        return from.viewController(viewControllerClass: self)
    }
}
