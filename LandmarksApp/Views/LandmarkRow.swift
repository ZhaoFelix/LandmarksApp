//
//  LandmarkRow.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/13.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark:Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}


struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
                // 设置预览布局的大小
                .previewLayout(.fixed(width: 300, height: 70))
            LandmarkRow(landmark: landmarks[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
