//
//  PartnerCarouselItemView.swift
//  SwiftUIExampleApp
//
//  Created by Ming Tee on 31/1/21.
//

import SwiftUI

struct PartnerCarouselItemView: View {
    var body: some View {
        let roundedRectangle = RoundedRectangle(cornerRadius: 25)
        VStack {
            PartnerThumbnailView()
            PartnerDescriptionView()
        }
        .clipShape(roundedRectangle)
        .overlay(
            roundedRectangle
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
}

struct PartnerCarouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        PartnerCarouselItemView()
    }
}
