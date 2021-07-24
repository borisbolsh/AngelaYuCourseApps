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
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    let eggTimer = ["Soft": 3, "Medium": 7, "Hard": 12]

    var timer = Timer()
    var totaltime = 0
    var secondesPassed = 0
    
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
    
        totaltime = eggTimer[hardness]!
        
        progressBar.progress = 0.0
        secondesPassed = 0
        titleLable.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondesPassed < totaltime {
            secondesPassed += 1
            progressBar.progress = Float(secondesPassed) / Float(totaltime)
        } else {
            timer.invalidate()
            titleLable.text = "DONE!"
        
            playSound(soundName: "alarm_sound")
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    

}
