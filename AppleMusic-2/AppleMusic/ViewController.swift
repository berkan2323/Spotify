//
//  ViewController.swift
//  AppleMusic
//
//  Created by Emirhan Erdogan on 23.08.2020.
//  Copyright © 2020 TurkishKit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet var albumImageView: UIImageView!
    
    @IBOutlet var reverseBackgroundView: UIView!
    @IBOutlet var reverseButton: UIButton!
    
    @IBOutlet var playPauseBackgroundView: UIView!
    @IBOutlet var playPauseButton: UIButton!
    
    @IBOutlet var forwardBackgroundView: UIView!
    @IBOutlet var forwardButton: UIButton!
    
    // MARK: - Properties
    var isPlaying: Bool = true {
        didSet {
            if isPlaying {
                playPauseButton.setImage(.pause, for: .normal)
            }else {
                playPauseButton.setImage(.play, for: .normal)
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reverseBackgroundView.layer.cornerRadius = 35
        reverseBackgroundView.clipsToBounds = true
        reverseBackgroundView.alpha = 0
        
        playPauseBackgroundView.layer.cornerRadius = 35
        playPauseBackgroundView.clipsToBounds = true
        playPauseBackgroundView.alpha = 0
        
        forwardBackgroundView.layer.cornerRadius = 35
        forwardBackgroundView.clipsToBounds = true
        forwardBackgroundView.alpha = 0
    }
    
    // MARK: - Actions
    @IBAction func playPauseButtonTapped(_ button: UIButton) {
        if isPlaying {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = .identity
            }
        }
        
        isPlaying.toggle()
    }
    
    @IBAction func touchedDown(_ button: UIButton) {
        let buttonBackground: UIView
        
        switch button {
        case reverseButton:
            buttonBackground = reverseBackgroundView
        case playPauseButton:
            buttonBackground = playPauseBackgroundView
        case forwardButton:
            buttonBackground = forwardBackgroundView
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            buttonBackground.alpha = 0.3
            button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    @IBAction func touchedUpInside(_ button: UIButton) {
        let buttonBackground: UIView
        
        switch button {
        case reverseButton:
            buttonBackground = reverseBackgroundView
        case playPauseButton:
            buttonBackground = playPauseBackgroundView
        case forwardButton:
            buttonBackground = forwardBackgroundView
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            buttonBackground.alpha = 0
            buttonBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            button.transform = .identity
        }) { (_) in
            buttonBackground.transform = .identity
        }
    }
}
