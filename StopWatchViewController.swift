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
        
        startButton.layer.cornerRadius = startButton.bounds.width / 2
        pauseButton.layer.cornerRadius = pauseButton.bounds.width / 2
        resetButton.layer.cornerRadius = resetButton.bounds.width / 2
        
    }
    
    
    @IBAction func resetDidTap(_ sender: Any)
    {
         timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        timerLabel.text = "00:00:00"
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    @IBAction func pauseDidTap(_ sender: Any)
    {
        resetButton.isEnabled = true
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        isTimerRunning = false
        timer.invalidate()
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
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600 // one hour = 3600 sec
        var hourString = "\(hour)"
        if hour < 10 {
            hourString = "0\(hour)"
        }
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        
        timerLabel.text = "\(hourString):\(minuteString):\(secondString)"
        
        
    }
}


