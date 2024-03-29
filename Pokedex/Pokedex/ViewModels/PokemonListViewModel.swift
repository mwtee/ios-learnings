//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Ming Tee on 9/3/21.
//

import Combine
import Foundation

protocol PokemonListViewModelType: ObservableObject {
    var state: PokemonListViewModel.State { get set }
    func fetchPokemonList()
}

class PokemonListViewModel: PokemonListViewModelType {
    @Published var state: State = .initial
    
    private let pokemonService: PokemonServiceType
    
    private var disposables = Set<AnyCancellable>()
    
    init(pokemonService: PokemonServiceType) {
        self.pokemonService = pokemonService
    }
    
    func fetchPokemonList() {
        state = .loading
        pokemonService.getPokemonList()
            .map { $0.results.map(PokemonSummaryModel.map) }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        print(error)
                        self.state = .error
                    case .finished:
                        print("finished")
                    }
                },
                receiveValue: { [weak self] model in
                    self?.state = State.loaded(pokemonModels: model)
                }).store(in: &disposables)
    }
}

extension PokemonListViewModel {
    enum State {
        case initial
        case loaded(pokemonModels: [PokemonSummaryModel])
        case loading
        case error
    }
}
