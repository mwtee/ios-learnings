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
        GridItem(alignment: .top)
    ]

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top, spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        VStack {
                            PartnerThumbnailView()
                            PartnerDescriptionView()
                        }
                    }
                }.background(Color.red)
            }.frame(height: 600, alignment: .center)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top) {
                    ForEach(items, id: \.self) { item in
                        Text("Heading\(item)")
                    }
                }.background(Color.blue)
            }.frame(height: 100, alignment: .center)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top) {
                    ForEach(items, id: \.self) { item in
                        Text("Heading\(item)")
                    }
                }.background(Color.green)
            }.frame(height: 100, alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
