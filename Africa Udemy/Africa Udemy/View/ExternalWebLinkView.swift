//
//  ExternalWebLinkView.swift
//  Africa Udemy
//
//  Created by Mewan on 02/02/2021.
//

import SwiftUI

struct ExternalWebLinkView: View {
        
    // MARK: - Body

    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.com")!)
                }
                .foregroundColor(.accentColor)
            } // : HSTACK
        } // : GROUP BOX
    }
    
    // MARK: - Properties

    let animal: Animal
}

// MARK: - Preview

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        ExternalWebLinkView(animal: animals[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
