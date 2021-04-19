//
//  HeadingView.swift
//  Africa Udemy
//
//  Created by Mewan on 02/02/2021.
//

import SwiftUI

struct HeadingView: View {
    
    // MARK: - Body

    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
            
        }// : HSTACK
        .padding(.vertical)
    }
    
    // MARK: - Properties
    
    var headingImage: String
    
    var headingText: String
}

// MARK: - Preview

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled",
                    headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
