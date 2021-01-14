//
//  Profile.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/14.
//

import Foundation


struct Profile {
    var username:String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalData = Date()
    
    static let `default` = Profile(username: "g_kumar")
    enum Season:String,CaseIterable,Identifiable {
        case spring = "🌹"
        case summer = "🐶"
        case autumn = "🍁"
        case winter = "☃️"
        
        var id:String  {self.rawValue}
    }
}
