//
//  LandmarkList.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/13.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
        List(landmarks) { landmark in
            NavigationLink(
                destination: LandmarkDetail(landmark: landmark),
                label: {
                    LandmarkRow(landmark: landmark)
                })
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
