//
//  TimerViewController.swift
//  FinalProjectKWK
//
//  Created by Katie Jiang on 7/29/20.
//  Copyright © 2020 Jessica Dai. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // picker
    @IBOutlet weak var pickerGoal: UIPickerView!
    var pickerData: [String] = [String]()
    // end of picker code for now
    
    // stopwatch code
    var nextVC = SessionsTableViewController()
    var startTime = TimeInterval()
    var timer = Timer()
    
    @IBOutlet weak var stopWatch: UILabel!
    // end of stopwatch code (for now)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pickerGoal.delegate = self
        self.pickerGoal.dataSource = self
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
    
    // Picker View Code
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }
    
    @IBAction func saveSession(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let todaySession = TimedSessionCD(entity: TimedSessionCD.entity(), insertInto: context)
            if let stopWatchTime = stopWatch.text {
                todaySession.timeSpent = stopWatchTime
                todaySession.goal = "a goal"
                todaySession.date = "07/31/2020"
            }
            try? context.save()
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelSession(_ sender: Any) {
        timer.invalidate()
        navigationController?.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
