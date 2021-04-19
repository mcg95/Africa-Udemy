//
//  LocationModel.swift
//  Africa Udemy
//
//  Created by Mewan on 17/04/2021.
//

import Foundation
import MapKit

struct Location: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
