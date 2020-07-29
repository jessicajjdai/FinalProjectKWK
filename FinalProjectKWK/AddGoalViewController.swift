//
//  AddGoalViewController.swift
//  FinalProjectKWK
//
//  Created by Jessica Dai on 7/29/20.
//  Copyright © 2020 Jessica Dai. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController {
    var previousVC = GoalsTableViewController()
    
    
    @IBOutlet weak var goalTitleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        let goal = Goals()
        // must check that something was typed in
        if let goalTitle = goalTitleTextField.text {
            // is there text in there and we can type
            //called unrapping, no null value
            goal.name = goalTitle
            goal.important = importantSwitch.isOn
        }
        // updates goals array with the new object
        previousVC.goals.append(goal)
        previousVC.tableView.reloadData()
        //ask if imbedding in navigation controller
        navigationController?.popViewController(animated: true)
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
