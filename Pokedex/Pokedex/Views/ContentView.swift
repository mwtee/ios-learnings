//
//  ContentView.swift
//  Pokedex
//
//  Created by Ming Tee on 4/3/21.
//

import Combine
import SwiftUI

struct ContentView: View {
    
    private let httpClient: HTTPClientType
    
    init(httpClient: HTTPClientType) {
        self.httpClient = httpClient
    }
    
    var body: some View {
        let viewModel = PokemonListViewModel(pokemonService: PokemonService(httpClient: httpClient))
        PokemonListView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(httpClient: HTTPClient())
    }
}
