//
//  AnimalDetailView.swift
//  Africa Udemy
//
//  Created by Mewan on 02/02/2021.
//

import SwiftUI

struct AnimalDetailView: View {
    
    // MARK: - Body

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24),
                        alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
                    )
                
                // HEADLINE
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                Group {
                    HeadingView(headingImage: animal.image,
                                headingText: animal.headline)
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // FACTS
                Group {
                    HeadingView(headingImage: "questionmark.circle",
                                headingText: "Did you know?")
                    
                    InsetFactView(animal: animal)
                }// : GROUP
                .padding(.horizontal)
                
                // DESCRIPTION
                Group {
                    HeadingView(headingImage: "info.circle",
                                headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .layoutPriority(1)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)
                
                //MAP
                Group {
                    HeadingView(headingImage: "map",
                                headingText: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                //LINK
                Group {
                    HeadingView(headingImage: "book.vertical",
                                headingText: "Learn More")
                    
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                
            }// : VSTACK
            .navigationBarTitle("Learn about \(animal.name)",
                                displayMode: .inline)
        }// : SCROLL VIEW
    }
    
    
    // MARK: - Properties

    let animal: Animal
}

// MARK: - Preview

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[2])
        }
    }
}
