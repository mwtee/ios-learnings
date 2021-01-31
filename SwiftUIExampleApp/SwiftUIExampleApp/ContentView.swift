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
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, alignment: .top, spacing: 10) {
                        ForEach(items, id: \.self) { item in
                            PartnerCarouselItemView()
                        }
                    }
                }

                Spacer().frame(height: 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, alignment: .top, spacing: 10) {
                        ForEach(items, id: \.self) { item in
                            PartnerCarouselItemView()
                        }
                    }
                }

                Spacer().frame(height: 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, alignment: .top, spacing: 10) {
                        ForEach(items, id: \.self) { item in
                            PartnerCarouselItemView()
                        }
                    }
                }
            }
        }
//        VStack {
//            ScrollView(.horizontal, showsIndicators: false) {
//                LazyHGrid(rows: rows, alignment: .top, spacing: 10) {
//                    ForEach(items, id: \.self) { item in
//                        PartnerCarouselItemView()
//                    }
//                }
//            }.frame(height: 600)
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                LazyHGrid(rows: rows, alignment: .top) {
//                    ForEach(items, id: \.self) { item in
//                        Text("Heading\(item)")
//                    }
//                }.background(Color.blue)
//            }.frame(height: 100, alignment: .center)
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                LazyHGrid(rows: rows, alignment: .top) {
//                    ForEach(items, id: \.self) { item in
//                        Text("Heading\(item)")
//                    }
//                }.background(Color.green)
//            }.frame(height: 100, alignment: .center)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
