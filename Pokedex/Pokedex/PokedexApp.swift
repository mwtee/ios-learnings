//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Ming Tee on 4/3/21.
//
 
import SwiftUI

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = PokemonListViewModel(
                pokemonService: PokemonService(
                    httpClient: HTTPClient()
                )
            )
            ContentView(viewModel: viewModel)
        }
    }
}
