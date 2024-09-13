//
//  MovieModel.swift
//  iOSAppTest
//
//  Created by Ateeq Ahmed on 13/09/24.
//

import Foundation

struct MovieModel: Codable {
    var title: String
    var imagePortrait: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case imagePortrait = "image_portrait"
    }
}


