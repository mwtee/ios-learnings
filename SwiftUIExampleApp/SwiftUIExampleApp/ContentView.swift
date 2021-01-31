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
            VStack {
                PartnerCarouselView()
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, alignment: .top, spacing: 10) {
                        ForEach(items, id: \.self) { item in
                            PartnerCarouselItemView()
                        }
                    }
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, alignment: .top, spacing: 10) {
                        ForEach(items, id: \.self) { item in
                            PartnerCarouselItemView()
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
