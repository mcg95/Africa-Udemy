//
//  GalleryView.swift
//  Africa Udemy
//
//  Created by Mewan on 02/02/2021.
//

import SwiftUI

struct GalleryView: View {
    
    // MARK: - Body

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 30) {
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                Slider(value: $gridColoumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColoumn, perform: { value in
                        gridSwitch()
                    })
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                hapticImpact.impactOccurred()
                            }
                    } // : Loop
                } // : Grid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            } // : VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } // : Scroll View
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AnimationView())
    }
    
    // MARK: - Functions
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColoumn))
    }
    
    // MARK: - Properties
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    /// Simple Grid
//    let gridLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    /// Efficient Grid
//    let gridLayout = Array(repeating: GridItem(.flexible()), count: 3)
    
    // MARK: - Internals

    /// Dynamic Grid
    @State private var gridLayout = [GridItem(.flexible())]
    
    @State private var gridColoumn = 3.0
    
    @State private var selectedAnimal = "lion"
}

// MARK: - Preview

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
            .previewDevice("iPhone 12")
    }
}
