# Countdown Timer ⏱ with ProgressView and Sound 🔊
Timer starts from a given number and count back to 1 like; `7...1`. ProgressView shows timer progress which increases on every step (second). When timer stops
it'll play [beep sound](https://github.com/M-Asad-Chattha/Features-Implementation-Codebase/blob/4ee63fe2a2d03c7ce6fe8c9c21dcde4f6a6f5e43/Features%20Implementation%20Codebase/CountDownTimer/beep.mp3)
from project's assets.

## Countdown Timer
``` 
Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            ///Closure
            self.updateTimer(timer: Timer)
        }
        
        func updateTimer(timer: Timer) {
        if secondsPassed < totalTime {
            countdownTime -= 1
            secondsPassed += 1
            updateProgressView()
            
        } else {
            timer.invalidate()
            playSound()
            resetTime()
        }
    }
```
For complete `Countdown Timer` Code, see [Implement Countdown Timer](https://github.com/M-Asad-Chattha/Features-Implementation-Codebase/commit/d262a8891d5aad7e4d0eedcc48e46136c2aea8c3#diff-1c4058f80684457bd44de02eabcd6fd8fb92365e4646473bad2bad159ddae4c0) 
commit.

## Progress View
```
func updateProgressView() {
        let percentageProgress = Float(secondsPassed) / Float(totalTime)
        timerProgressView.progress = percentageProgress
    }
```
For Complete `ProgressView` code, see [Implement ProgressView, which increases with timer](https://github.com/M-Asad-Chattha/Features-Implementation-Codebase/commit/46efa74eb707e79087080ccb7b74c7db4aebcc6d#diff-1c4058f80684457bd44de02eabcd6fd8fb92365e4646473bad2bad159ddae4c0)
commit.

## PlaySound
```
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
```
For complete `PlaySound` code, see [Play beep sound when timer finishes](https://github.com/M-Asad-Chattha/Features-Implementation-Codebase/commit/4ee63fe2a2d03c7ce6fe8c9c21dcde4f6a6f5e43) 
commit.

>In below [Gif](CountdownTimer.gif), sound will not play because **gif** can't embed sounds. Xcode may don't load Gifs in Markdown file.


![CountdownTimer](CountdownTimer.gif)
