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
    static let tipAmounts = [10, 15, 20, 25, 0]

    @State private var tipAmount = 0
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var showingPaymentAlert = false

    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }

    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }

                Toggle(isOn: $addLoyaltyDetails.animation(), label: {
                    Text("Add iDine loyalty card")
                })

                TextField("Enter your iDine ID", text: $loyaltyNumber)
            }

            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0..<Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])% ")
                    }
                }
            }

            Section(header:
                        Text("Total: $\(totalPrice, specifier: "%.2f")")
                        .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle("Payment", displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert, content: {
            let messageText = Text(
                "Your total was $\(totalPrice, specifier: "%.2f") – thank you!"
            )
            return Alert(
                title: Text("Order confirmed"),
                message: messageText,
                dismissButton: .default(Text("OK"))
            )
        })
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
