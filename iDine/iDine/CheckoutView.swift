//
//  CheckoutView.swift
//  iDine
//
//  Created by Ming Tee on 25/1/21.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order

    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    @State private var paymentType = 0

    var body: some View {
        VStack {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
            }
        }
        .navigationBarTitle("Payment", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            CheckoutView().environmentObject(order)
        }
    }
}
