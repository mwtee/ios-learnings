//
//  ContentView.swift
//  iDine
//
//  Created by Ming Tee on 20/1/21.
//

import SwiftUI

struct ContentView: View {

    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(
                        header: Text(section.name)
                            .font(.headline),
                        content: {
                            ForEach(section.items) {
                                ItemRow(item: $0)
                            }
                        }
                    )
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
