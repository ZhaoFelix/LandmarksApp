//
//  ProfileSummary.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/14.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData:ModelData
    
    var profile:Profile
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10, content: {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date:") + Text(profile.goalData,style: .date)
                
                Divider()
                
                VStack(alignment: .leading, content: {
                    Text("Completed Badges")
                        .font(.headline)
                    ScrollView(.horizontal ,content: {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    })
                })
                Divider()
                VStack(alignment: .leading, content: {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                })
            })
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
