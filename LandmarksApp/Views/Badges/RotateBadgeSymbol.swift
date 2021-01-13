//
//  RotateBadgeSymbol.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/13.
//

import SwiftUI

struct RotateBadgeSymbol: View {
    let angle:Angle
    var body: some View {
       BadgeSymbol()
        .padding(-60)
        .rotationEffect(angle, anchor: .bottom)
    
    }
}

struct RotateBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotateBadgeSymbol(angle: Angle(degrees: 5))
    }
}
