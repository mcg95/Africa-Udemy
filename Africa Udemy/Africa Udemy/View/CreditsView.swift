//
//  CreditsView.swift
//  Africa Udemy
//
//  Created by Mewan on 18/04/2021.
//

import SwiftUI

struct CreditsView: View {
    
    // MARK: - Body

    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
        Copyright © Mewan Chathuranga.
        All rights reserved.
        """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.4)
    }
}

// MARK: - Preview

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
