//
//  PokedexService.swift
//  Pokedex
//
//  Created by Ming Tee on 7/3/21.
//

import Combine
import Foundation

protocol PokemonServiceType {
    func getPokemonList() -> AnyPublisher<PokemonListResponse, HTTPClientError>
}

final class PokemonService: PokemonServiceType {
    
    private let httpClient: HTTPClientType
    
    init(httpClient: HTTPClientType) {
        self.httpClient = httpClient
    }
    
    func getPokemonList() -> AnyPublisher<PokemonListResponse, HTTPClientError> {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100")!
        let pokemonListRequest: AnyPublisher<PokemonListResponse, HTTPClientError> = httpClient.performJsonDecodableGetRequest(request: URLRequest(url: url))
        return pokemonListRequest
    }
}
