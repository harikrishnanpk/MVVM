//
//  Reusable.swift
//  hushPro
//
//  Created by harikrishnan on 08/07/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation
import UIKit

protocol Reusable: class {
  static var reuseIdentifier: String { get }
  static var nib: UINib? { get }
}

extension Reusable {
  static var reuseIdentifier: String { return String(describing: self) }
  static var nib: UINib? { return nil }
}
