//
//  TimerViewController.swift
//  Stop Watch
//
//  Created by Azatbek Kanybekov on 4/15/19.
//  Copyright © 2019 Azatbek Kanybekov. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    var seconds = 30
    var timer = Timer()
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        label.text = String(seconds) + " seconds"
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func start(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.counter), userInfo: nil, repeats: true)
        startOutlet.isEnabled = false
        stopOutlet.isEnabled = true
        sliderOutlet.isHidden = true
        if seconds == 0 {
            seconds = 30 
        }
    }
    @objc func counter() {
        seconds -= 1
        label.text = String(seconds) + " seconds"
        
        if seconds == 0 {
            timer.invalidate()
            startOutlet.isEnabled = true
            sliderOutlet.isHidden = false
            
        }
    }
    
   
    
    
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stop(_ sender: AnyObject) {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        label.text = "30" + " seconds"
        stopOutlet.isEnabled = false
        startOutlet.isEnabled = true
        sliderOutlet.isHidden = false

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOutlet.isEnabled = true
        stopOutlet.isEnabled = false
        sliderOutlet.isHidden = false
     
    }
    

}
