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
