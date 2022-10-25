//
//  InfoView.swift
//  Pokedex
//
//  Created by hakkı can şengönül on 25.10.2022.
//

import UIKit
class InfoView: UIView {
    // MARK: - Properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    private lazy var nameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink
        view.layer.cornerRadius = 5
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
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
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .mainPink
        button.setTitle("View More Info", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleViewMoreInfo), for: .touchUpInside)
        return button
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension InfoView{
    private func setup(){
        backgroundColor = .white
        layer.masksToBounds = true
        //nameContainerView setup
        nameContainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameContainerView)
        //imageView setup
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        //typeLabel,defenseLabel,seperatorView,heightLabel,weightLabel,pokedexLabel,attackLabel,infoButton setup
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(typeLabel)
        defenseLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(defenseLabel)
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(seperatorView)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(heightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(weightLabel)
        pokedexLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pokedexLabel)
        attackLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(attackLabel)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(infoButton)
    }
    private func layout(){
        //nameContainerView layout
        NSLayoutConstraint.activate([
            nameContainerView.heightAnchor.constraint(equalToConstant: 50),
            nameContainerView.topAnchor.constraint(equalTo: topAnchor),
            nameContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: nameContainerView.trailingAnchor)
        ])
        //imageView layout
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: nameContainerView.bottomAnchor, constant: 24)
        ])
        //typeLabel,defenseLabel,seperatorView,weightLabel,pokedexLabel,attackLabel,infoButton layout
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            defenseLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: defenseLabel.trailingAnchor, constant: 8),
            
            seperatorView.heightAnchor.constraint(equalToConstant: 1),
            seperatorView.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 8),
            seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            trailingAnchor.constraint(equalTo: seperatorView.trailingAnchor, constant: 4),
            
            heightLabel.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 16),
            heightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            weightLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 16),
            weightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            pokedexLabel.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: pokedexLabel.trailingAnchor, constant: 8),
            
            attackLabel.topAnchor.constraint(equalTo: pokedexLabel.bottomAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: attackLabel.trailingAnchor, constant: 8),
            
            bottomAnchor.constraint(equalTo: infoButton.bottomAnchor, constant: 12),
            infoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            trailingAnchor.constraint(equalTo: infoButton.trailingAnchor, constant: 12),
            infoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
// MARK: - Selector
extension InfoView {
    @objc func handleViewMoreInfo(_ sender: UIButton){
        
    }
}
