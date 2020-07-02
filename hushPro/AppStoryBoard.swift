//
//  AppStoryBoard.swift
//  hushPro
//
//  Created by harikrishnan on 26/06/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryBoard: String {
    case Main = "Main"
    case Login = "Login"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass: T.Type, function: String = #function, line: Int = #line, file: String = #file) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
}
