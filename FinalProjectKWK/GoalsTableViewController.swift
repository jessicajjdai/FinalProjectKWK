//
//  GoalsTableViewController.swift
//  FinalProjectKWK
//
//  Created by Jessica Dai on 7/29/20.
//  Copyright © 2020 Jessica Dai. All rights reserved.
//

import UIKit

class GoalsTableViewController: UITableViewController {
    var goals : [Goals] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goals = createGoals()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func createGoals() -> [Goals] {
        let water = Goals()
        water.name = "Drink Water"
        water.important = true
        water.difficultyLevel = 3
        
        let diet = Goals()
        diet.name = "Eat Healthy"
        diet.difficultyLevel = 2
        
        return[water, diet]
    }
    
    

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // nothing will show up in table if return is 0
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //
        
        return goals.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let goal = goals[indexPath.row]
        
        if goal.important {
            cell.textLabel?.text = "🔥" + goal.name
        } else {
            cell.textLabel?.text = "⬇️" + goal.name
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goal = goals[indexPath.row]
        
        performSegue(withIdentifier: "moveToGoalInfo", sender: goal)
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let addVC = segue.destination as? AddGoalViewController {
            addVC.previousVC = self;
        }
        
        if let completeVC = segue.destination as? CompleteGoalViewController {
            if let goals = sender as? Goals {
                completeVC.selectedGoal = goals
                completeVC.previousVC = self
            }
        }
        
        if let getNumVC = segue.destination as? HomeViewController {
            getNumVC.tableGoalVC = self;
        }
    }
    

}
