//
//  PokemonInfoController.swift
//  Pokedex
//
//  Created by hakkı can şengönül on 27.10.2022.
//

import UIKit
class PokemonInfoController: UIViewController {
    // MARK: - Properties
    var pokemon: Pokemon?{
        didSet{
            guard let pokemon = pokemon else { return }
            guard let type = pokemon.type else { return }
            guard let defense = pokemon.defense else { return }
            guard let attack = pokemon.attack else { return }
            guard let id = pokemon.id else { return }
            guard let height = pokemon.height else { return }
            guard let weight = pokemon.weight else { return }
            imageView.image = pokemon.image
            infoLabel.text = pokemon.description
            navigationItem.title = pokemon.name
            configurelabel(label: typeLabel, title: "Type", details: type)
            configurelabel(label: defenseLabel, title: "Defense", details: "\(defense)")
            configurelabel(label: heightLabel, title: "Height", details: "\(height)")
            configurelabel(label: weightLabel, title: "Weigth", details: "\(weight)")
            configurelabel(label: pokedexLabel, title: "Pokedex Id", details: "\(id)")
            configurelabel(label: attackLabel, title: "Base Attack", details: "\(attack)")
        }
    }
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    private let firstEvoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    private let SecondtEvoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    private let typeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let defenseLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let heightLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let pokedexLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let attackLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let weightLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .groupTableViewBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let evolutionView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink
        let label = UILabel()
        label.textColor = .white
        label.text = "Next Evolution: Charmeleon"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return view
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
// MARK: - Helpers
extension PokemonInfoController{
    private func style(){
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        //imageView style
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        //infoLabel style
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoLabel)
        //typeLabel,defenseLabel,seperatorView,heightLabel,weightLabel,pokedexLabel,attackLabel,infoButton setup
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(typeLabel)
        defenseLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(defenseLabel)
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(seperatorView)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weightLabel)
        pokedexLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pokedexLabel)
        attackLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(attackLabel)
        //evolutionView style
        evolutionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(evolutionView)
        //firstEvoImageView & SecondtEvoImageView style
        firstEvoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstEvoImageView)
        SecondtEvoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SecondtEvoImageView)
    }
    private func layout(){
        //imageView layout
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12)
        ])
        //infoLabel layout
        NSLayoutConstraint.activate([
            infoLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor, constant: 4)
        ])
        //typeLabel,defenseLabel,seperatorView,weightLabel,pokedexLabel,attackLabel,infoButton layout
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 25),
            typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            defenseLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 25),
            view.trailingAnchor.constraint(equalTo: defenseLabel.trailingAnchor, constant: 8),
            
            seperatorView.heightAnchor.constraint(equalToConstant: 1),
            seperatorView.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 8),
            seperatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            view.trailingAnchor.constraint(equalTo: seperatorView.trailingAnchor, constant: 4),
            
            heightLabel.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 16),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            weightLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 16),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            pokedexLabel.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: pokedexLabel.trailingAnchor, constant: 8),
            
            attackLabel.topAnchor.constraint(equalTo: pokedexLabel.bottomAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: attackLabel.trailingAnchor, constant: 8),
        ])
        //evolutionView layout
        NSLayoutConstraint.activate([
            evolutionView.heightAnchor.constraint(equalToConstant: 60),
            evolutionView.topAnchor.constraint(equalTo: weightLabel.bottomAnchor,constant: 12),
            evolutionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: evolutionView.trailingAnchor)
        ])
        //firstEvoImageView & SecondtEvoImageView layout
        NSLayoutConstraint.activate([
            firstEvoImageView.widthAnchor.constraint(equalToConstant: 120),
            firstEvoImageView.heightAnchor.constraint(equalToConstant: 120),
            firstEvoImageView.topAnchor.constraint(equalTo: evolutionView.bottomAnchor, constant: 20),
            firstEvoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            SecondtEvoImageView.widthAnchor.constraint(equalToConstant: 120),
            SecondtEvoImageView.heightAnchor.constraint(equalToConstant: 120),
            SecondtEvoImageView.topAnchor.constraint(equalTo: evolutionView.bottomAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: SecondtEvoImageView.trailingAnchor, constant: 32)
        ])
    }
}
