//
//  UITableView.swift
//  hushPro
//
//  Created by harikrishnan on 08/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }

}
