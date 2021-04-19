//
//  InsetFactView.swift
//  Africa Udemy
//
//  Created by Mewan on 02/02/2021.
//

import SwiftUI

struct InsetFactView: View {
       
    // MARK: - Body

    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }// : TAB VIEW
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            .tabViewStyle(PageTabViewStyle())
        }// : GROUP BOX
    }
    
    // MARK: - Properties

    let animal: Animal
}

// MARK: - Preview

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        InsetFactView(animal: animals[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
