//
//  PlayerViewControllerNew.swift
//  AppleSearchAPIDemo
//
//  Created by Rajneesh on 03/12/20.
//  Copyright © 2020 Nagarro. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    var detailViewModel : DetailScreenViewModel
    var player: AMPlayer? = nil
    
    init(viewModel: DetailScreenViewModel) {
        detailViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let playButton : UIButton = {
        let playButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.setImage(UIImage(systemName: "pause"), for: .selected)
        playButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        playButton.isEnabled = false
        return playButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupPlayButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = detailViewModel.title
        
        // Pop back if there is no media url available,
        // Because we have nothing to play.
        guard let _ = detailViewModel.mediaString else {
            self.title = ""
            player = nil
            self.navigationController?.popViewController(animated: animated)
            return
        }
        
        detailViewModel.mediaData(onCompletion: { [weak self] (data) in
            self?.player = AMPlayer(mediaData: data)
            
            /* Enable play button only after getting data to play*/
            self?.playButton.isEnabled = true
        })
    }
    
    private func setupPlayButton() {
        playButton.center = view.center
        self.view.addSubview(playButton)
    }
    
}

// Button Actions
extension PlayerViewController {
    @objc func buttonAction(sender: UIButton!) {
        if !sender.isSelected {
            self.player?.play()
        } else {
            self.player?.pause()
        }
        sender.isSelected = !sender.isSelected
    }
}

class AMPlayer {
    
    private lazy var audioPlayer : AVAudioPlayer = {
        let player = try! AVAudioPlayer(data: mediaData)
        player.prepareToPlay()
        player.volume = 20
        return player
    }()
    
    private var mediaData: Data
    var mediaPlayed = false
    
    init(mediaData: Data) {
        self.mediaData = mediaData
    }
    
    func play() -> Void {
        mediaPlayed = self.audioPlayer.play()
    }
    
    func pause() -> Void {
        self.audioPlayer.pause()
    }
}

