//
//  SearchView.swift
//  SwiftUIExampleApp
//
//  Created by Ming Tee on 3/2/21.
//

import SwiftUI

struct SearchView: View {

    @State private var isPresented = false
    @State private var searchInput: String = ""

    var body: some View {
        VStack {
            HStack {
                Image("search_icon2")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .padding(.leading, 15)
            TextField("Search brands, products, stores...", text: $searchInput)
                .background(Color.white)
                .padding(EdgeInsets(top: 25, leading: 15, bottom: 15, trailing: 15))
            }

            HStack {
                Image("placeholder_logo").resizable().frame(width: 221, height: 50).padding()

                Spacer()

                Button(action: {
                    self.isPresented.toggle()
                }) {
                    Text("Filter")
                }
                .sheet(
                    isPresented: $isPresented,
                    content: { EmptyView() }
                )
                .padding(.trailing, 15)
            }
        }
        .background(Color.init(red: 186 / 255, green: 241 / 255, blue: 222 / 255))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


struct Empty: Identifiable {
    let id: String
}

struct EmptyView: View {
    var body: some View {
        Text("Empty")
    }
}

extension HorizontalAlignment {
    private enum OneThird : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.width / 3
        }
    }
    static let oneThird = HorizontalAlignment(OneThird.self)
}
