//
//  PokemonSummaryModel.swift
//  Pokedex
//
//  Created by Ming Tee on 9/3/21.
//

import Foundation

struct PokemonSummaryModel: Identifiable {
    var id: String { name }
    let name: String
}

extension PokemonSummaryModel {
    static func map(from result: PokemonListResponse.Result) -> PokemonSummaryModel {
        return PokemonSummaryModel(name: result.name)
    }
}
