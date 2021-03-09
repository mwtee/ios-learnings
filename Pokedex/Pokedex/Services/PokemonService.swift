//
//  PokedexService.swift
//  Pokedex
//
//  Created by Ming Tee on 7/3/21.
//

import Combine
import Foundation

final class PokemonService {
    
    private let httpClient: HTTPClientType
    
    init(httpClient: HTTPClientType) {
        self.httpClient = httpClient
    }
    
    func getPokemonList() -> AnyPublisher<PokemonListResponse, Error> {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100&offset=200")!
        return httpClient.perform(request: URLRequest(url: url))
    }
}
