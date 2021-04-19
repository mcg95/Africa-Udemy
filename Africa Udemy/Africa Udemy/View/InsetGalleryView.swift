//
//  InsetGalleryView.swift
//  Africa Udemy
//
//  Created by Mewan on 02/02/2021.
//

import SwiftUI

struct InsetGalleryView: View {
    
    // MARK: - Body

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self ) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }// : LOOP
            }// : HSTACK
        }// : SCROLL VIEW
    }
    
    // MARK: - Properties

    let animal: Animal
}

// MARK: - Preview

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        InsetGalleryView(animal: animals[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
