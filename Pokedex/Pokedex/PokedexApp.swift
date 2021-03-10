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
            ContentView(httpClient: HTTPClient())
        }
    }
}
