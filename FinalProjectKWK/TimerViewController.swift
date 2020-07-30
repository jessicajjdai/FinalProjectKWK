//
//  TimerViewController.swift
//  FinalProjectKWK
//
//  Created by Katie Jiang on 7/29/20.
//  Copyright © 2020 Jessica Dai. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController{
    // picker
    @IBOutlet weak var pickerGoal: UIPickerView!
    var pickerData: [String] = [String]()
    // end of picker code for now
    
    // stopwatch code
    var startTime = TimeInterval()
    var timer = Timer()
    
    @IBOutlet weak var stopWatch: UILabel!
    // end of stopwatch code (for now)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pickerData = ["Goal 1", "Goal 2", "Goal 3"]
    }
    
    

    // continue timer/stopwatch code
    @IBAction func start(_ sender: Any) {
        if (!timer.isValid) {
            let aSelector = #selector(updateTime)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = Date.timeIntervalSinceReferenceDate
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
    }
    
    @objc func updateTime() {
        var currentTime = Date.timeIntervalSinceReferenceDate
        
        //Find the difference between current time and start time.
        var elapsedTime: TimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (TimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= TimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        
        //concatenate minutes, seconds as assign it to the UILabel
        let timeElapsed = "\(strMinutes):\(strSeconds)"
        stopWatch.text = timeElapsed
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
