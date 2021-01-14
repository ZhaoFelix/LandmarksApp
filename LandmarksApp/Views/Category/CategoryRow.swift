//
//  CategoryRow.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/13.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName:String
    var items:[Landmark]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading,15)
                .padding(.top,5)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 0, content: {
                    ForEach(items) { landmark in
                      NavigationLink(
                        destination: LandmarkDetail(landmark: landmark),
                        label: {
                            CategoryItem(landmark: landmark)
                        })
                    }
                })
            })
            .frame(height:185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(4))
        )
    }
}
