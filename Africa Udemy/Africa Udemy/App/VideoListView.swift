//
//  VideoListView.swift
//  Africa Udemy
//
//  Created by Mewan on 02/02/2021.
//

import SwiftUI

struct VideoListView: View {
        
    // MARK: - Body

    var body: some View {
        NavigationView {
            List(videos) { item in
                NavigationLink(destination: VideoPlayerView(selectedVideo: item.id, selectedTitle: item.name)) {
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
        } //: NAVIGATION
        
    }

    // MARK: - Properties

    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Internals

    @State private var videos: [Video] = Bundle.main.decode("videos.json")
}

// MARK: - Preview

struct VideoListView_Previews: PreviewProvider {
    
    static var previews: some View {
        VideoListView()
            .previewDevice("iPhone 12")
    }
}
