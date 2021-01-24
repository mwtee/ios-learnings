//
//  iDineApp.swift
//  iDine
//
//  Created by Ming Tee on 20/1/21.
//

import SwiftUI

@main
struct iDineApp: App {

    let order = Order()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(order)
        }
    }
}
