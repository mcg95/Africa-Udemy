//
//  VideoPlayerView.swift
//  Africa Udemy
//
//  Created by Mewan on 17/04/2021.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    // MARK: - Body

    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: selectedVideo, fileFormat: "mp4"))
                .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8),
                    alignment: .topLeading
                )
        }
        .accentColor(.accentColor)
        .navigationTitle(selectedTitle)
    }
    
    // MARK: - Properties
    
    let selectedVideo: String
    
    let selectedTitle: String
}

// MARK: - Preview

struct VideoPlayerView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            VideoPlayerView(selectedVideo: "cheetah", selectedTitle: "Cheetah")
        }
    }
}
