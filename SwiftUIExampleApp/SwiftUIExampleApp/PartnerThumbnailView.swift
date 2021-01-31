//
//  PartnerView.swift
//  SwiftUIExampleApp
//
//  Created by Ming Tee on 28/1/21.
//

import SwiftUI

struct PartnerThumbnailView: View {
    var body: some View {
        Image("carousel")
            .resizable()
            .frame(width: 130, height: 150)
    }
}

struct PartnerThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        PartnerThumbnailView()
    }
}
