//
//  ItemRow.swift
//  iDine
//
//  Created by Ming Tee on 24/1/21.
//

import SwiftUI

struct ItemRow: View {

    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    let item: MenuItem

    var body: some View {
        NavigationLink(destination: ItemDetails(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))

                VStack(alignment: .leading) {
                    Text(item.name)
                    Text("$\(item.price)")
                }

                Spacer()

                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
