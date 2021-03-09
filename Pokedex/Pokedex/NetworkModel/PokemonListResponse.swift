//
//  PokemonListResponse.swift
//  Pokedex
//
//  Created by Ming Tee on 9/3/21.
//

import Foundation

struct PokemonListResponse: Decodable {
    let results: [Result]
    
    struct Result: Decodable {
        let name: String
        let url: String
    }
}
