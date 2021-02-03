//
//  SearchView.swift
//  SwiftUIExampleApp
//
//  Created by Ming Tee on 3/2/21.
//

import SwiftUI

struct SearchView: View {

    @State private var isPresented = false

    var body: some View {
        VStack {
            HStack {
                Image("afterpay_logo").resizable().frame(width: 221, height: 90)

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
