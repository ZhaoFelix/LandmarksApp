//
//  ProfileHost.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/14.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData:ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
            
        VStack(alignment: .leading, spacing: 20, content: {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancle") {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            }else {
                ProfileEditor(profile:$draftProfile)
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
            
        })
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}

