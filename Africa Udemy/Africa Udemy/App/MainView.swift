//
//  MainView.swift
//  Africa Udemy
//
//  Created by Mewan on 02/02/2021.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Body

    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Browse")
                }
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Hey")
                }
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Hey")
                }
        }
    }
}

// MARK: - Preview

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
