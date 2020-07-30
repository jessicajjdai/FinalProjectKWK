//
//  Whatever.swift
//  FinalProjectKWK
//
//  Created by Mimi Zhang on 7/29/20.
//  Copyright © 2020 Jessica Dai. All rights reserved.
//

import UIKit

class HomeViewController : UIViewController {
    @IBOutlet weak var numGoalStatus: UILabel!
    var tableGoalVC = GoalsTableViewController()
    
    override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
       }
    var finalName = ""
    /*
    numGoalStatus.text = "You are currently working on" + tableGoalVC.goals.count()
    */
}
