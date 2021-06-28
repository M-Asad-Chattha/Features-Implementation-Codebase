//
//  CountdownTimerViewController.swift
//  Features Implementation Codebase
//
//  Created by Muhammad Asad Chattha on 2021-06-22.
//

import UIKit
import AVFoundation

class CountdownTimerViewController: UIViewController {

    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var timerProgressView: UIProgressView!
    
    var player: AVAudioPlayer?
    
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
    
    //MARK: - PlaySound Swift version: 5.4
    func playSound() {
        guard let path = Bundle.main.path(forResource: "beep", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
