//
//  PartnerDescriptionView.swift
//  SwiftUIExampleApp
//
//  Created by Ming Tee on 31/1/21.
//

import SwiftUI

struct PartnerDescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("MYER")
            Spacer().frame(height: 100)
            HStack {
                Spacer()
                Image("myer")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
        }.padding()
    }
}

struct PartnerDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PartnerDescriptionView()
    }
}
