//
//  ContentView.swift
//  Africa Udemy
//
//  Created by Mewan on 02/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Body

    var body: some View {
        
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(
                                EdgeInsets(top: 0,
                                           leading: 0,
                                           bottom: 0,
                                           trailing: 0)
                            )
                        
                        ForEach(animals) { item in
                            NavigationLink(
                                destination: AnimalDetailView(animal: item)) {
                                AnimalListItemView(animal: item)
                            }// : LINK
                        }// : LOOP
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }// : LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }// : CONDITION
            }// : GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = false
                            hapticImpact.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            hapticImpact.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            })
        }// : NAVIGATION VIEW
    }
    
    // MARK: - Functions
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
            
        case 2:
            toolbarIcon = "square.grid.3x2"

        case 3:
            toolbarIcon = "rectangle.grid.1x2"

        default:
            toolbarIcon = "square.grid.2x2"

        }
    }
    
    // MARK: - Properties
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Internals
    
    @State private var gridLayout = [GridItem(.flexible())]
    
    @State private var gridColumn = 1
    
    @State private var toolbarIcon = "square.grid.2x2"

    @State private var isGridViewActive = false
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
