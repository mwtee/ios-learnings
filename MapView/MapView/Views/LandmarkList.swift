//
//  LandmarkList.swift
//  MapView
//
//  Created by Ming Tee on 14/12/20.
//

import SwiftUI

struct LandmarkList: View {

    @State private var showFavouritesOnly = true

    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavouritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {

                Toggle(isOn: $showFavouritesOnly, label: {
                    Text("Favorites only")
                })

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
