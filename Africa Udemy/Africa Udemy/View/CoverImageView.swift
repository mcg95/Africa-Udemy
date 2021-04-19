//
//  CoverImageView.swift
//  Africa Udemy
//
//  Created by Mewan on 02/02/2021.
//

import SwiftUI

struct CoverImageView: View {
    
    // MARK: - Body

    var body: some View {
        TabView {
            ForEach(covers) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } // : LOOP
        }// : TAB VIEW
        .tabViewStyle(PageTabViewStyle())
    }
    
    // MARK: - Internals

    private let covers: [CoverImage] = Bundle.main.decode("covers.json")
}

// MARK: - Preview

struct CoverImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
