//
//  genreButtonScreenViewController.swift
//  Simple Music Player
//
//  Created by Deeptadeep Roy on 03/10/19.
//  Copyright © 2019 Deeptadeep Roy. All rights reserved.
//

import UIKit
import MediaPlayer

class genreButtonScreenViewController: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()
        self.roundButtonRock.layer.cornerRadius = 15
        self.roundedHiphop.layer.cornerRadius = 15
        self.roundButtonPop.layer.cornerRadius = 15
        self.roundedButtonNext.layer.cornerRadius = 15
        self.roundedButtonStop.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var roundButtonRock: UIButton!
    @IBOutlet weak var roundButtonPop: UIButton!
    @IBOutlet weak var roundedHiphop: UIButton!
    @IBOutlet weak var roundedButtonStop: UIButton!
    @IBOutlet weak var roundedButtonNext: UIButton!
    
    
    @IBAction func genreButtonTap(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                self.playerGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    func playerGenre(genre : String) {
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre , forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
