//
//  UIApplication.swift
//  hushPro
//
//  Created by harikrishnan on 26/06/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    static func setRootView(_ viewController: UIViewController,
                            options: UIView.AnimationOptions = .transitionCrossDissolve,
                            animated: Bool = true,
                            duration: TimeInterval = 0.5,
                            completion: (() -> Void)? = nil){
        
        guard let keyWindow = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else {
            return
        }

        guard animated else {
            keyWindow.rootViewController = viewController
            return
        }
        
        UIView.transition(with: keyWindow, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            keyWindow.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }) { _ in
            completion?()
        }
    }
}
