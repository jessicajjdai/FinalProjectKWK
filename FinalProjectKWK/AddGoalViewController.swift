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
    //pointSystem Code
    var pointTotal = Int()
    var addPoints = coin()
    var diffLev = Int()

    
    @IBOutlet weak var goalTitleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func easyButton(_ sender: UIButton) {
           diffLev = 1 //setting the difficulty level
    
       }
       @IBAction func mediumButton(_ sender: UIButton){
           diffLev = 2 //setting the difficulty level
       }
       @IBAction func hardButton(_ sender: UIButton){
           diffLev = 3 //setting the difficulty level
       }

    
    func setPoints() -> Int{ // setting up point system
        let goal1 = coin() //goal1 is a new coin object, created everytime
        goal1.goal = goalTitleTextField.text!
        goal1.numOfCoins = Int.random(in: 1...5)
        goal1.difficultyLevel = diffLev
        goal1.points = goal1.difficultyLevel * goal1.numOfCoins
            return(goal1.points)
        }
    @IBAction func addTapped(_ sender: Any) {
        
        // we have to grab this view context to be able to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

          // we are creating a new ToDoCD object here, naming it toDo
          let goal = GoalCD(entity: GoalCD.entity(), insertInto: context)

          // if the titleTextField has text, we will call that text titleText
          if let titleText = goalTitleTextField.text {
              // we will take the titleText and assign that value to toDo.name
              // this .name and .important came from the attributes you typed in on the Core Data page!
              goal.name = titleText
              goal.important = importantSwitch.isOn
          }
            try? context.save()
            
            navigationController?.popViewController(animated: true)
            
        //PointSystem code
             addPoints.points = setPoints()
                print(addPoints.points) //for debugging
                    //Creating core data object to store total number of points that user currently has
                if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                    let totPoints = PointSystem(entity: PointSystem.entity(), insertInto: context)
            //            totPoints.totalPoints = Int64(nextVC.pointTotal)
                    pointTotal += addPoints.points
                    totPoints.totalPoints += Int64(pointTotal)
                    try? context.save()
                }
            
           


        
        
        // code for iteration 1
        /*
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
        */
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let rewardsVC = segue.destination as? PointsViewController {
                rewardsVC.previousVC = self
            }

    }
    

}

}
