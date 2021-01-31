//
//  PartnerTitleView.swift
//  SwiftUIExampleApp
//
//  Created by Ming Tee on 31/1/21.
//

import SwiftUI

struct PartnerTitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Back to School...and Back to Work!")
                    .font(.title2)
                    .fontWeight(.medium)

                Spacer().frame(width: 40)

                Image("arrow")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .cornerRadius(20/2)

            }
            Divider()
        }.padding(.horizontal, 15)
    }
}

struct PartnerTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PartnerTitleView()
    }
}
