//
//  AnimalGridItemView.swift
//  Africa Udemy
//
//  Created by Mewan on 18/04/2021.
//

import SwiftUI

struct AnimalGridItemView: View {

    // MARK: - Body

    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
    
    // MARK: - Properties

    let animal: Animal
}

// MARK: - Preview

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
