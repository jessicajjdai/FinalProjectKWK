//
//  CompleteGoalViewController.swift
//  FinalProjectKWK
//
//  Created by Jessica Dai on 7/30/20.
//  Copyright © 2020 Jessica Dai. All rights reserved.
//

import UIKit

class CompleteGoalViewController: UIViewController {
    var previousVC = GoalsTableViewController()
    var selectedGoal = Goals()
    
    @IBOutlet weak var goalTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        goalTitle.text = selectedGoal.name
    }
    
    @IBAction func completeTapped(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
