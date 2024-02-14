//
//  UIFont+Extensions.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation
import UIKit

extension UIFont {
    
    enum Family: String {
        case bold = "Bold"
        case light = "Light"
        case medium = "Medium"
    }
    
    enum Size: CGFloat {
        case big = 18.0
        case medium = 15.0
        case small = 12.0
    }

    static func gSans(size: Size, weight: Family = .medium) -> UIFont {
        return UIFont(name: "GmarketSans\(weight.rawValue)", size: size.rawValue)!
    }
}
