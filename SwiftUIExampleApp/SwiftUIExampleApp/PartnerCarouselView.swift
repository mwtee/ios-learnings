//
//  PartnerCarouselView.swift
//  SwiftUIExampleApp
//
//  Created by Ming Tee on 31/1/21.
//

import SwiftUI

struct PartnerCarouselView: View {

    let items = 1...10

    let rows = [
        GridItem()
    ]

    var body: some View {
        VStack(alignment: .leading) {
            PartnerTitleView()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .top, spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        PartnerCarouselItemView()
                    }
                }
            }.frame(height: 310)
        }
    }
}

struct PartnerCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        PartnerCarouselView()
    }
}
