//
//  CountdownTimerViewController.swift
//  Features Implementation Codebase
//
//  Created by Muhammad Asad Chattha on 2021-06-22.
//

import UIKit

class CountdownTimerViewController: UIViewController {

    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var timerProgressView: UIProgressView!
    
    var totalTime = 7
    var countdownTime = 7
    var secondsPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Countdown Timer
    
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
        ///Countdown time from a specific number to 1 (like; 7...1)
        if secondsPassed < totalTime {
            remainingTimeLabel.text = "\(countdownTime)"
            countdownTime -= 1
            secondsPassed += 1
            updateProgressView()
        } else {
            timer.invalidate()
            playSound()
            resetTime()
        }
    }
    
    /**
     Reset all timer & progressView variables to their startup state
     */
    func resetTime() {
        remainingTimeLabel.text = "Timer ends❗️"
        countdownTime = 7 //Reset timer
        secondsPassed = 0 //Reset seconds
    }
    
    //MARK: - Progress View
    func updateProgressView() {
        let percentageProgress = Float(secondsPassed) / Float(totalTime)
        timerProgressView.progress = percentageProgress
    }
}
