//
//  HikeView.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/13.
//

import SwiftUI

struct HikeView: View {
    var hike:Hike
    @State private var showDetail = false
    var body: some View {
        VStack {
            HStack {
               Text("")
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        HikeView(hike:ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
