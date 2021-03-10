//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Ming Tee on 10/3/21.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject private var viewModel: PokemonListViewModel
    
    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.state {
        case .initial:
            Text("Initial state").onAppear(perform: {
                viewModel.fetchPokemonList()
            })
        case .loaded(let pokemonModels):
            List {
                ForEach(pokemonModels) { pokemonModel in
                    Text(pokemonModel.name)
                }
            }
        case .loading:
            ProgressView()
        case .error:
            Text("Error state")
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(viewModel:
                        PokemonListViewModel(
                            pokemonService: PokemonService(
                                httpClient: HTTPClient()
                            )
                        )
        )
    }
}
