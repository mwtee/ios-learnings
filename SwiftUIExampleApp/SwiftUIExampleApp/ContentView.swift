//
//  ContentView.swift
//  SwiftUIExampleApp
//
//  Created by Ming Tee on 27/1/21.
//

import SwiftUI

struct ContentView: View {
    let items = 1...10

    let rows = [
        GridItem()
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                PartnerCarouselView()
                PartnerCarouselView()
                PartnerCarouselView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
