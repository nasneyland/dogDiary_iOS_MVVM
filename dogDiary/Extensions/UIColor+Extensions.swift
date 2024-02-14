//
//  UIColor+Extensions.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: String){
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
    }
    
    //MARK: TODO 색상코드 안쓰는거 정리
    static let main = UIColor(hex: "#0066ff")
    static let gray = UIColor(hex: "#CED4DA")
    
//    static let support = UIColor(displayP3Red: 32/255, green: 35/255, blue: 50/255, alpha: 1)
//    static let red = UIColor(displayP3Red: 221/255, green: 105/255, blue: 93/255, alpha: 1)
//    static let yellow = UIColor(displayP3Red: 253/255, green: 174/255, blue: 97/255, alpha: 1)
//    static let green = UIColor(displayP3Red: 101/255, green: 171/255, blue: 132/255, alpha: 1)
//    static let blue = UIColor(displayP3Red: 69/255, green: 117/255, blue: 180/255, alpha: 1)
//    static let purple = UIColor(displayP3Red: 94/255, green: 79/255, blue: 162/255, alpha: 1)
//
//    static let lightRed = UIColor(displayP3Red: 249/255, green: 155/255, blue: 139/255, alpha: 1)
//    static let lightYellow = UIColor(displayP3Red: 254/255, green: 197/255, blue: 140/255, alpha: 1)
//    static let lightGreen = UIColor(displayP3Red: 172/255, green: 220/255, blue: 173/255, alpha: 1)
//    static let lightBlue = UIColor(displayP3Red: 141/255, green: 172/255, blue: 211/255, alpha: 1)
//    static let lightPurple = UIColor(displayP3Red: 189/255, green: 182/255, blue: 220/255, alpha: 1)
//
//    static let genderPink = UIColor(displayP3Red: 213/255, green: 100/255, blue: 124/255, alpha: 1)
//    static let genderBlue = UIColor(displayP3Red: 40/255, green: 103/255, blue: 160/255, alpha: 1)
//
//    static let tracker1 = UIColor(displayP3Red: 201/255, green: 221/255, blue: 237/255, alpha: 1)
//    static let tracker2 = UIColor(displayP3Red: 163/255, green: 192/255, blue: 224/255, alpha: 1)
//    static let tracker3 = UIColor(displayP3Red: 144/255, green: 172/255, blue: 218/255, alpha: 1)
//    static let tracker4 = UIColor(displayP3Red: 140/255, green: 158/255, blue: 217/255, alpha: 1)
//    static let tracker5 = UIColor(displayP3Red: 133/255, green: 138/255, blue: 214/255, alpha: 1)
}
