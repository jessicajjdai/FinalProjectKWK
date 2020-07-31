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
    var addVC = AddGoalViewController()
    var selectedGoal : GoalsCD?
    //PointSystemCode
    var pointTotal = 500
    var addPoints = coin()
    
    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var difficultyLevelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        goalTitle.text = selectedGoal?.name
        difficultyLevelOutlet.text = difficultyLevelLabel()
    }
    
    func setPoints() -> Int{ // setting up point system
        let goal1 = coin() //goal1 is a new coin object, created everytime
        goal1.goal = goalTitle.text!
        goal1.numOfCoins = Int.random(in: 1...5)
        goal1.difficultyLevel = addVC.diffLev
        goal1.points = goal1.difficultyLevel * goal1.numOfCoins
        print(goal1.points)
        return(goal1.points)
        
    }
    

    @IBAction func completeTapped(_ sender: UIButton) {
         addPoints.points = setPoints()
         pointTotal += addPoints.points
         print(pointTotal)
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
          if let theGoal = selectedGoal {
            context.delete(theGoal)
            navigationController?.popViewController(animated: true)
          }
        }
    }

    
    func difficultyLevelLabel() -> String {
        if selectedGoal?.difficultyLevel == 1 {
            return "🌶"
        } else if selectedGoal?.difficultyLevel == 2 {
            return "🌶🌶"
        } else if selectedGoal?.difficultyLevel == 3 {
            return "🌶🌶🌶"
        } else {
        return "null"
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let pointsVC = segue.destination as? PointsViewController {
            pointsVC.completeVC = self
        }
        if let shopVC = segue.destination as? ShopViewController {
            shopVC.nextVC = self
        }
    }
    
}
