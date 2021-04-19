//
//  AnimationView.swift
//  Africa Udemy
//
//  Created by Mewan on 18/04/2021.
//

import SwiftUI

struct AnimationView: View {
    
    // MARK: - Body

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                    )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                } //: LOOP
            } //: ZSTACK
            .drawingGroup()
        } //: GEOMETRY READER
    }
    
    // MARK: - Functions

    //Random coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    //random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    //random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...0.2))
    }
    
    //random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    //random delauyy
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    // MARK: - Internals

    @State private var randomCircle = Int.random(in: 12...16)
    
    @State private var isAnimating = false
}

// MARK: - Preview

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
            .previewDevice("iPhone 12")
    }
}
