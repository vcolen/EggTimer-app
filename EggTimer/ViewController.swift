//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer!
    var timer = Timer()
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        let hardness = sender.currentTitle!
        let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7]
        var secondsRemaining = eggTime[hardness]
        label.text = "\(secondsRemaining!) seconds!"
        let percentagePerSecond = 1/Float(secondsRemaining!)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
        label.text = "\(secondsRemaining!) seconds!"
        progressBar.progress += percentagePerSecond
        secondsRemaining! -= 1
            if secondsRemaining! > 0 {
                label.text = "\(secondsRemaining!) seconds!"
            } else {
                timer.invalidate()
                label.text = "Done!"
                playSound(sender.currentTitle!)
            }
        }
       
    }
    
    func playSound(_ soundName: String) {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}
