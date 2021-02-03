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
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 20) {
                    Spacer().frame(height: 120)
                    PartnerCarouselView()
                    PartnerCarouselView()
                    PartnerCarouselView()
                }
            }
            SearchView()
                .clipShape(
                    RoundedRectangle(cornerRadius: 25)
                )
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
