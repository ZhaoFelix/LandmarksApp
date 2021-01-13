//
//  LandmarkDetail.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/13.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark:Landmark
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinates)
                .ignoresSafeArea(edges: .top)
                .frame(height:300)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom,-130)
            VStack(alignment: .leading){
                Text(landmark.name)
                    .font(.title)
                    .foregroundColor(.primary)
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                        
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("About Turtle Rock")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            Spacer()
        }
        // 设置标题栏文字和展示样式
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
