//
//  ContentView.swift
//  Experiments
//
//  Created by Ming Tee on 28/2/21.
//

import SwiftUI

import SwiftUI
struct LabelView: View {
    let number: Int
    var body: some View {
        print("LabelView")
        return Group {
            if number > 0 {
                Text("You've tapped \(number) times")
            }
        }
    }
}
struct ContentView: View {
    @State var counter = 0
    var body: some View {
        print("ContentView")
        return VStack {
            Button("Tap me!") { self.counter += 1 }
            LabelView(number: counter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
