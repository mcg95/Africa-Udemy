//
//  MapAnnotationView.swift
//  Africa Udemy
//
//  Created by Mewan on 17/04/2021.
//

import SwiftUI

struct MapAnnotationView: View {
    
    // MARK: - Body

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 40, height: 40, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 38, height: 38, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35, alignment: .center)
                .clipShape(Circle())
        } //: ZSTACK
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
    
    // MARK: - Internals
    
    @State private var animation: Double = 0.0
    
    // MARK: - Properties

    let location: Location
}

// MARK: - Preview

struct MapAnnotationView_Previews: PreviewProvider {
    static let locations: [Location] = Bundle.main.decode("locations.json")

    static var previews: some View {
        MapAnnotationView(location: locations[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
