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
    var filteredPokemon = [Pokemon]()
    var insearchMode = false
    var searchBar: UISearchBar!
    private let infoView: InfoView = {
        let view = InfoView()
        view.layer.cornerRadius = 5
        return view
    }()
    private let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
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
        //visualEffectView style
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(visualEffectView)
        visualEffectView.alpha = 0
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDismissal))
        visualEffectView.addGestureRecognizer(gestureRecognizer)
        
    }
    private func layout(){
        //visualEffectView layout
        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(equalTo: view.topAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: visualEffectView.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: visualEffectView.trailingAnchor)
        ])
    }
    private func configureNavigation(){
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .mainPink
        navigationItem.title = "Poketex"
        configureSearchBarButton()
    }
    private func dismissInfoView(pokemon: Pokemon?){
        UIView.animate(withDuration: 0.5) {
            self.infoView.alpha = 0
            self.infoView.transform = .init(scaleX: 1.3, y: 1.3)
            self.visualEffectView.alpha = 0
        } completion: { _ in
            self.infoView.removeFromSuperview()
        }
    }
    private func configureSearchBarButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearcBar))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    private func configureSearchBar(){
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
        searchBar.tintColor = .white
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
    }
}
// MARK: - UISearchBarDelegate
extension PokedexController: UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        configureSearchBarButton()
        insearchMode = false
        collectionView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" || searchBar.text == nil{
            insearchMode = false
            collectionView.reloadData()
            view.endEditing(true)
        }else{
            insearchMode = true
            filteredPokemon = pokemon.filter({$0.name?.range(of: searchText.uppercased()) != nil})
            collectionView.reloadData()
        }
    }
}
// MARK: - Selectors
extension PokedexController{
    @objc func showSearcBar(_ sender: UIBarButtonItem){
        configureSearchBar()
    }
    @objc func handleDismissal(_ sender: UITapGestureRecognizer){
        dismissInfoView(pokemon: nil)
    }
}
// MARK: - UICollectionViewDelegate/DataSource
extension PokedexController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return insearchMode ? filteredPokemon.count : pokemon.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokedexCell
        cell.pokemon = insearchMode ? self.filteredPokemon[indexPath.item]: self.pokemon[indexPath.item]
        cell.delegate = self
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
// MARK: - PokedexCellDelegate
extension PokedexController: PokedexCellDelegate{
    func presentInfoView(withPokemon pokemon: Pokemon) {
        //infoView style
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.delegate = self
        infoView.pokemon = pokemon
        view.addSubview(infoView)
        //infoView layout
        NSLayoutConstraint.activate([
            infoView.heightAnchor.constraint(equalToConstant: 350),
            infoView.widthAnchor.constraint(equalToConstant: view.frame.width - 64),
            infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -44),
        ])
        infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        infoView.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.infoView.alpha = 1
            self.infoView.transform = .identity
            self.visualEffectView.alpha = 1
        }
    }
}
// MARK: - InfoViewDelegate
extension PokedexController: InfoViewDelegate{
    func dismissInfoView(withPokemon pokemon: Pokemon?) {
        dismissInfoView(pokemon: pokemon)
    }
}
