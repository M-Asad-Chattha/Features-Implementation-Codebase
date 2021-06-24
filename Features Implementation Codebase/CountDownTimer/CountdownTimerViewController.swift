//
//  CountdownTimerViewController.swift
//  Features Implementation Codebase
//
//  Created by Muhammad Asad Chattha on 2021-06-22.
//

import UIKit

class CountdownTimerViewController: UIViewController {

    var countdownTime = 7
        
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Update remainingTimeLabel with provided value like; 7
        remainingTimeLabel.text = "7"
    }
    
    //MARK: - Countdown Timer [Countdown time from a specific number to 1 (like; 7...1)]
    
    @IBAction func startCountdownTimer(_ sender: UIButton) {
        
        ///withTimeInterval: 1.0 means 1second
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            
            ///Closure
            self.updateTimer(timer: Timer)
        }
    }
    
    /**
     Update @countdownTime and UI on every second.
     - Parameter timer: contain Timer object refrence passed by Closure.
     */
    func updateTimer(timer: Timer) {
        if self.countdownTime > 0 {
            remainingTimeLabel.text = "\(countdownTime)"
            countdownTime -= 1
        } else {
            timer.invalidate()
            self.remainingTimeLabel.text = "Timer ends❗️"
            self.countdownTime = 7 //Reset time
        }
    }
    
}
