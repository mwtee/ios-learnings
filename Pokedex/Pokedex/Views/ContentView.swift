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
