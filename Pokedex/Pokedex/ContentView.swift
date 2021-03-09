//
//  ContentView.swift
//  Pokedex
//
//  Created by Ming Tee on 4/3/21.
//

import Combine
import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel: PokemonListViewModel
    
    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.pokemonModels) { pokemonModel in
                Text(pokemonModel.name)
            }
        }.onAppear(perform: {
                viewModel.fetchPokemonList()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel:
                        PokemonListViewModel(
                            pokemonService: PokemonService(
                                httpClient: HTTPClient()
                            )
                        )
        )
    }
}

// 1
class PokemonListViewModel: ObservableObject, Identifiable {
    @Published var pokemonModels: [PokemonModel] = []
    
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
                self?.pokemonModels = pokemonResponse.results.map(PokemonModel.map(from:))
            }).store(in: &disposables)
    }
}

struct PokemonModel: Identifiable {
    var id: String { name }
    let name: String
}

extension PokemonModel {
    static func map(from result: PokemonListResponse.Result) -> PokemonModel {
        return PokemonModel(name: result.name)
    }
}
