//
//  Extensions.swift
//  PermissionScope
//
//  Created by Nick O'Neill on 8/21/15.
//  Copyright © 2015 That Thing in Swift. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /// Returns the inverse color
    var inverseColor: UIColor{
        var r:CGFloat = 0.0; var g:CGFloat = 0.0; var b:CGFloat = 0.0; var a:CGFloat = 0.0;
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: 1.0-r, green: 1.0 - g, blue: 1.0 - b, alpha: a)
        }
        return self
    }
}

extension String {
    /// NSLocalizedString shorthand
    var localized: String {
        
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(withArguments arguments: String...) -> String {
        return localized(withArguments: arguments, placeholder: "%@")
    }
    
    func localized(withArguments arguments: String..., placeholder:String) -> String {
        return localized(withArguments: arguments, placeholder: placeholder)
    }
    
    func localized(withArguments arguments:[String], placeholder:String) -> String {
        var tmp = NSLocalizedString(self, comment: "")
        var range = tmp.startIndex..<tmp.endIndex
        var index = 0
        while range.lowerBound < range.upperBound {
            let plRange = tmp.range(of: placeholder, options: .literal, range: range, locale: nil)
            if plRange == nil || index >= arguments.count{
                break
            }
            tmp = tmp.replacingOccurrences(of: placeholder, with: arguments[index], options: .literal, range: plRange)
            index += 1
            range = (plRange?.upperBound)!..<tmp.endIndex
        }
        return tmp
    }
    
}

extension CGRect {
    public mutating func offsetInPlace(dx: CGFloat, dy: CGFloat) {
        self = offsetBy(dx: dx, dy: dy)
    }
}

extension Optional {
    /// True if the Optional is .None. Useful to avoid if-let.
    var isNil: Bool {
        if case .none = self {
            return true
        }
        return false
    }
}
