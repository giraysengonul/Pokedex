//
//  Service.swift
//  Pokedex
//
//  Created by hakkı can şengönül on 11.10.2022.
//

import UIKit

class Service {
    static let shared = Service()
    let BASE_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    func fetchPokemon(completion: @escaping([Pokemon]) -> Void) {
        var pokemonArray = [Pokemon]()
        guard let url = URL(string: BASE_URL) else{ return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else{ return }
            do{
                guard let resultArray = try JSONSerialization.jsonObject(with: data, options: []) as? [Any] else{ return }
                for (key, value) in resultArray.enumerated() {
                    if let dictionary = value as? [String: Any] {
                        var pokemon = Pokemon(id: key, dictionary: dictionary)
                        guard let imageUrl = pokemon.imageUrl else { return }
                        self.fetchImage(withUrlString: imageUrl) { image in
                            pokemon.image = image
                            pokemonArray.append(pokemon)
                            pokemonArray.sort{ pokemon1, pokemon2 in
                                return pokemon1.id! < pokemon2.id!
                            }
                            completion(pokemonArray)
                        }
                    }
                }
            }catch let error{
                print(error.localizedDescription)
            }
            
            
        }.resume()
    }
    
    private func fetchImage(withUrlString urlString: String, completion: @escaping(UIImage)->Void){
        guard let url = URL(string: urlString) else{ return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else{ return }
            guard let image = UIImage(data: data) else{ return }
            completion(image)
        }.resume()
    }
}
