//
//  MapViewApp.swift
//  MapView
//
//  Created by Ming Tee on 13/12/20.
//

import SwiftUI

@main
struct MapViewApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
