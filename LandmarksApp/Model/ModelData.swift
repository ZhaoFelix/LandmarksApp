//
//  ModelData.swift
//  LandmarksApp
//
//  Created by FelixZhao on 2021/1/13.
//

import Foundation

var landmarks:[Landmark] = load("landmarkData.json")

func load<T:Decodable>(_ filename:String) -> T {
    let data:Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("Coudln't load \(filename) from main budle:\n \(error)")
    }
    
    do {
        let devoder = JSONDecoder()
        return try devoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n \(error)")
    }
}
