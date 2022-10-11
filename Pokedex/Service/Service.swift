//
//  Service.swift
//  Pokedex
//
//  Created by hakkı can şengönül on 11.10.2022.
//

import Foundation

class Service {
    static let shared = Service()
    let BASE_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    func fetchPokemon() {
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
                        let pokemon = Pokemon(id: key, dictionary: dictionary)
                        print(pokemon.name)
                    }
                }
            }catch let error{
                print(error.localizedDescription)
            }
            
            
        }.resume()
    }
}
