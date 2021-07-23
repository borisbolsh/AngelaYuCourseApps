//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimer = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
    
        switch hardness {
        case "Soft":
            print("\(eggTimer["Soft"] ?? 0)")
        case "Medium":
            print("\(eggTimer["Medium"] ?? 0)")
        case "Hard":
            print("\(eggTimer["Hard"] ?? 0)")
        default:
            print("Error chef")
        }
        
        
    }
    

}
