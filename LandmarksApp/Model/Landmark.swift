//
//  Landmark.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/13.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark:Hashable,Codable,Identifiable {
    var id:Int
    var name:String
    var park:String
    var state:String
    var description:String
    var isFavorite:Bool
    var isFeatured:Bool
    
    var category: Category
    
    enum Category:String,CaseIterable,Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName:String
    var image:Image {
        Image(imageName)
    }
    
    var featureImage:Image? {
        isFavorite ? Image(imageName + "_feature") : nil
    }
    
    private var coordinates:Coordinates
    var locationCoordinates:CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates:Hashable,Codable {
        var latitude:Double
        var longitude:Double
    }
}

