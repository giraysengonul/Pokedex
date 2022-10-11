//
//  Extension.swift
//  Pokedex
//
//  Created by hakkı can şengönül on 11.10.2022.
//

import UIKit
extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) ->UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static let mainPink = UIColor.rgb(red: 221, green: 94, blue: 86)
}
