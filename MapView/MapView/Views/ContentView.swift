//
//  ContentView.swift
//  MapView
//
//  Created by Ming Tee on 13/12/20.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
