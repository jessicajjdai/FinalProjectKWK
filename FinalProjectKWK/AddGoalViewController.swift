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
    var diffLev = Int()//Point System

    
    @IBOutlet weak var goalTitleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var easyButtonOutlet: UIButton!
    @IBOutlet weak var mediumButtonOutlet: UIButton!
    @IBOutlet weak var hardButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //button colors
        easyButtonOutlet.backgroundColor = .white
        mediumButtonOutlet.backgroundColor = .white
        hardButtonOutlet.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    @IBAction func easyButton(_ sender: UIButton) {
        if easyButtonOutlet.backgroundColor == .white{
            easyButtonOutlet.backgroundColor = .green
            diffLev = 1 //setting the difficulty level
        }else if easyButtonOutlet.backgroundColor == .green{
            easyButtonOutlet.backgroundColor = .white
            diffLev = 0 //resetting the difficulty level
        }
       }
    
       @IBAction func mediumButton(_ sender: UIButton){
        if mediumButtonOutlet.backgroundColor == .white{
            mediumButtonOutlet.backgroundColor = .green
            diffLev = 2 //setting the difficulty level
        }else if mediumButtonOutlet.backgroundColor == .green{
            mediumButtonOutlet.backgroundColor = .white
            diffLev = 0 // resetting the difficulty level
        }
       }
       @IBAction func hardButton(_ sender: UIButton){
        if hardButtonOutlet.backgroundColor == .white{
            hardButtonOutlet.backgroundColor = .green
            diffLev = 3 //setting the difficulty level
        }else if hardButtonOutlet.backgroundColor == .green{
            hardButtonOutlet.backgroundColor = .white
            diffLev = 0 // resetting the difficulty level
        }
       }

    
   
    
    @IBAction func addTapped(_ sender: Any) {
        /*
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
              goal.difficultyLevel = Int16(diffLev)
          }
            try? context.save()
            
            navigationController?.popViewController(animated: true)
            
        */
            
           


        
        
        // code for iteration 1
        
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
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    //there was an error saying it needed override, but idk if it actually does, i added it on for now, dont know what that changes
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
            if let completeVC = segue.destination as? CompleteGoalViewController {
                completeVC.nextVC = self
            }
        

        }
    

    }

