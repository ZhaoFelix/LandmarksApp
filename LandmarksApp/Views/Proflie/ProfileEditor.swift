//
//  ProfileEditor.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/14.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile:Profile
    
    var dateRange:ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1,to: profile.goalData)!
        let max = Calendar.current.date(byAdding: .year, value: 1,to: profile.goalData)!
        return min...max
    }
    var body: some View {
        List {
            HStack {
                Text("Username")
                    .bold()
                Divider()
                TextField("Username",text:$profile.username)
            }
            Toggle(isOn: $profile.prefersNotifications, label: {
                Text("Enable Notifications")
                    .bold()
            })
            VStack(alignment: .leading, spacing: 20, content: {
                Text("Seasonal Photo").bold()
                Picker("Seasonal Photo",selection:$profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) {
                        season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            })
            DatePicker(selection: $profile.goalData, in: dateRange,displayedComponents:.date) {
                Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}

