//
//  MapView.swift
//  Africa Udemy
//
//  Created by Mewan on 02/02/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // MARK: - Body

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            /// (A) PIN: Basic style (always static)
//            MapPin(coordinate: item.location, tint: .accentColor)
            
            /// (B) PIN: New Style (always static)
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            /// (C) PIN: Basic style (interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .frame(width: 20, height: 20, alignment: .center)
//                    .scaledToFit()
//            }
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        } //: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    } //: HSTACK
                    
                    Divider()
                    
                    HStack {
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()

                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)

                    } //: HSTACK
                } //: VSTACK
                
            } //: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        )
    }
    
    // MARK: - Properties
    
    let locations: [Location] = Bundle.main.decode("locations.json")
    
    // MARK: - Internals

    @State private var region: MKCoordinateRegion = {
        let mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        return MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    }()
}

// MARK: - Preview

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
