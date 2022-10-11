//
//  PokedexController.swift
//  Pokedex
//
//  Created by hakkı can şengönül on 11.10.2022.
//

import UIKit
class PokedexController: UICollectionViewController {
     // MARK: - Properties
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
 // MARK: - Helpers
extension PokedexController{
    private func style(){
        collectionView.backgroundColor = .systemPurple
    }
    private func layout(){
        
    }
}
