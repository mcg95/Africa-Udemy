//
//  CenterModifier.swift
//  Africa Udemy
//
//  Created by Mewan on 18/04/2021.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
