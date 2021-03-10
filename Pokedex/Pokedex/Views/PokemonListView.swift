//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Ming Tee on 10/3/21.
//

import SwiftUI

struct PokemonListView<ViewModel: PokemonListViewModelType>: View {
    
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
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
        PokemonListView(viewModel: MockPokemonListViewModel())
    }
}

private final class MockPokemonListViewModel: PokemonListViewModelType, ObservableObject {
    @Published var state: PokemonListViewModel.State = .initial
    
    func fetchPokemonList() {
        state = .loaded(pokemonModels: [
            PokemonSummaryModel(name: "charmander"),
            PokemonSummaryModel(name: "pikachu")
        ])
    }
}
