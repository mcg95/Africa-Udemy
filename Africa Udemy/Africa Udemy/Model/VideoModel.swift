//
//  VideoModel.swift
//  Africa Udemy
//
//  Created by Mewan on 17/04/2021.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        return "video-" + id
    }
}
