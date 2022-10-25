//
//  PokedexCell.swift
//  Pokedex
//
//  Created by hakkı can şengönül on 11.10.2022.
//

import UIKit
class PokedexCell: UICollectionViewCell {
    // MARK: - Properties
    var pokemon: Pokemon? {
        didSet{
            nameLabel.text = pokemon?.name
            imageView.image = pokemon?.image
        }
    }
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    lazy var nameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return view
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Bulbasaur"
        return label
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension PokedexCell{
    private func style(){
        layer.cornerRadius = 10
        clipsToBounds = true
        //imageView style
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        //nameContainerView style
        nameContainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameContainerView)
    }
    private func layout(){
        //imageView layout
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: frame.height - 32)
        ])
        //nameContainerView layout
        NSLayoutConstraint.activate([
            nameContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomAnchor.constraint(equalTo: nameContainerView.bottomAnchor),
            trailingAnchor.constraint(equalTo: nameContainerView.trailingAnchor),
            nameContainerView.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}
