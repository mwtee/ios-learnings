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
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(
                    EdgeInsets(
                        top: 5,
                        leading: 15,
                        bottom: 0,
                        trailing: 0)
                )
            Spacer()
            HStack {
                Spacer()
                Image("myer")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(
                        EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 0,
                            trailing: 15)
                    )
            }
        }
    }
}

struct PartnerDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PartnerDescriptionView()
    }
}
