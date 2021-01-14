//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by FelixZhao on 2021/1/14.
//

import SwiftUI
import MapKit
struct LandmarkDetail: View {
    @EnvironmentObject var modelData:ModelData
    var landmark:Landmark
    var landmarkIndex:Int {
        modelData.landmarks.firstIndex(where:{ $0.id == landmark.id })!
    }
    var body: some View {
        ScrollView {
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                MapView(coordinate: landmark.locationCoordinates)
                    .ignoresSafeArea( edges: .top)
                    .frame(height:300)
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinates))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            })
            VStack(alignment: .leading, spacing:20, content: {
                HStack(spacing:24) {
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                                .foregroundColor(.primary)
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(PlainButtonStyle())
                        }
                        
                        VStack(alignment: .leading,spacing:4) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            })
            .padding()
            .frame(maxWidth:700)
            .offset(y:-50)
        }
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
            .frame(width: 850, height: 700)
        
    }
}
