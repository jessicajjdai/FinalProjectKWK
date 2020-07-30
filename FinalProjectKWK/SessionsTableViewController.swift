//
//  SessionsTableViewController.swift
//  FinalProjectKWK
//
//  Created by Katie Jiang on 7/30/20.
//  Copyright © 2020 Jessica Dai. All rights reserved.
//

import UIKit

class SessionsTableViewController: UITableViewController {
    
    var savedSessions : [TimedSessionCD] = []
    
    /* func createSessions() -> [TimedSessionCD] {
        let monday = TimedSessionCD()
        monday.goal = "Read more"
        monday.timeSpent = "15:00"
        monday.date = "5/13/2020"
        
        let tuesday = TimedSessionCD()
        tuesday.goal = "Read more"
        tuesday.timeSpent = "30:00"
        tuesday.date = "3/23/2020"
        
        return [monday, tuesday]
    } */
    
    func getSessionLog() {
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        if let coreDataSavedSessions = try? context.fetch(TimedSessionCD.fetchRequest()) as? [TimedSessionCD] {
                   savedSessions = coreDataSavedSessions
                   tableView.reloadData()
        }
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        // savedSessions = createSessions()
        self.tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        getSessionLog()
    }
    
    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return savedSessions.count
    }
    


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseTableIdentifier", for: indexPath)
        let listedSession = savedSessions[indexPath.row]
        if let listedGoal = listedSession.goal {
            cell.textLabel?.text = "MM/dd/yyyy \(listedGoal) for " + listedSession.timeSpent!
        }
        // Configure the cell...

        return cell
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
        if let addVC = segue.destination as? TimerViewController {
          addVC.nextVC = self
        }
    }

}
