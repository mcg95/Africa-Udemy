//
//  VideoPlayerUtility.swift
//  Africa Udemy
//
//  Created by Mewan on 17/04/2021.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName name: String, fileFormat format: String) -> AVPlayer {
    let videoURL = Bundle.main.url(forResource: name, withExtension: format)
    if videoURL != nil {
        videoPlayer = AVPlayer(url: videoURL!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
