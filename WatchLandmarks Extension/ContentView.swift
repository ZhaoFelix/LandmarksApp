//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by FelixZhao on 2021/1/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
