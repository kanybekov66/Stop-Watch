//
//  StopWatchViewController.swift
//  Stop Watch
//
//  Created by Azatbek Kanybekov on 4/5/19.
//  Copyright © 2019 Azatbek Kanybekov. All rights reserved.
//

import UIKit
class StopWatchViewController: UIViewController {
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    
    @IBAction func resetDidTap(_ sender: Any)
    {
        
    }
    
    @IBAction func pauseDidTap(_ sender: Any)
    {
        
    }
    
    @IBAction func startDidTap(_ sender: Any)
    {
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
        }
    }
    
    @objc func runTimer() {
        counter += 0.1
        timerLabel.text = "\(counter)"
    }
}

