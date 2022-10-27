//
//  PokedexController+AttributedText.swift
//  Pokedex
//
//  Created by hakkı can şengönül on 27.10.2022.
//

import UIKit
func configurelabel(label: UILabel, title: String, details: String){
    let attributedText = NSMutableAttributedString(string: "\(title): ",attributes: [.font : UIFont.boldSystemFont(ofSize: 16), .foregroundColor : UIColor.mainPink])
    attributedText.append(NSAttributedString(string: details,attributes: [.font : UIFont.systemFont(ofSize: 16), .foregroundColor : UIColor.gray]))
    label.attributedText = attributedText
}
