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
For complete `Countdown Timer` Code, see [✨ feat(CountdownTimer): implement timer](https://github.com/M-Asad-Chattha/Features-Implementation-Codebase/commit/946356145e4a1438a7e65f5b67632d85784c80af) 
commit.

## Progress View
```
func updateProgressView() {
        let percentageProgress = Float(secondsPassed) / Float(totalTime)
        timerProgressView.progress = percentageProgress
    }
```
For Complete `ProgressView` code, see [✨ feat(CountdownTimer): add progressView](https://github.com/M-Asad-Chattha/Features-Implementation-Codebase/commit/95bb7d412ac43d5dc5b111a71b8398e2bdf508d8)
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
For complete `PlaySound` code, see [✨ feat(CountdownTimer): add sound play feature](https://github.com/M-Asad-Chattha/Features-Implementation-Codebase/commit/e0b8967ef8df1d9a336b0bcf53ac4bcaf26ca54b) 
commit.

>In below [Gif](CountdownTimer.gif), sound will not play because **gif** can't embed sounds. Xcode may don't load Gifs in Markdown file.


![CountdownTimer](CountdownTimer.gif)
