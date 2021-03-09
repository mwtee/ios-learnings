//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Ming Tee on 9/3/21.
//

import Combine
import Foundation

class PokemonListViewModel: ObservableObject, Identifiable {
    @Published var pokemonModels: [PokemonSummaryModel] = []
    
    private let pokemonService: PokemonService
    
    private var disposables = Set<AnyCancellable>()
    
    init(pokemonService: PokemonService) {
        self.pokemonService = pokemonService
    }
    
    func fetchPokemonList() {
        pokemonService.getPokemonList().receive(on: DispatchQueue.main).sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("finished")
                }
            },
            receiveValue: { [weak self] pokemonResponse in
                print(pokemonResponse)
                self?.pokemonModels = pokemonResponse.results.map(PokemonSummaryModel.map(from:))
            }).store(in: &disposables)
    }
}
