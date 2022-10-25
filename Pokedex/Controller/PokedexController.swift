//
//  PokedexController.swift
//  Pokedex
//
//  Created by hakkı can şengönül on 11.10.2022.
//

import UIKit
private let reuseIdentifier = "PokedexCell"
class PokedexController: UICollectionViewController {
    // MARK: - Properties
    var pokemon = [Pokemon]()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        fetch()
    }
    // MARK: - API
    func fetch(){
        Service.shared.fetchPokemon { pokemon in
            DispatchQueue.main.async {
                self.pokemon = pokemon
                self.collectionView.reloadData()
            }
        }
    }
}
// MARK: - Helpers
extension PokedexController{
    private func style(){
        collectionView.backgroundColor = .white
        configureNavigation()
        collectionView.register(PokedexCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    private func layout(){
        
    }
    private func configureNavigation(){
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .mainPink
        navigationItem.title = "Poketex"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSerarcBar))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
}
// MARK: - Selectors
extension PokedexController{
    @objc func showSerarcBar(_ sender: UIBarButtonItem){
    }
}
// MARK: - UICollectionViewDelegate/DataSource
extension PokedexController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokedexCell
        print(indexPath.item)
        cell.pokemon = self.pokemon[indexPath.item]
        return cell
    }
}
extension PokedexController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 36) / 3
        return CGSize.init(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let EdgeInt = UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
        return EdgeInt
    }
}
