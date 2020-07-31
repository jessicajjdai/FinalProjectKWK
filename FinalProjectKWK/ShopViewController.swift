//
//  ShopViewController.swift
//  FinalProjectKWK
//
//  Created by Mimi Zhang on 7/30/20.
//  Copyright © 2020 Jessica Dai. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {
    var nextVC = CompleteGoalViewController()
    var previousVC = GoalWorldViewController()
    
    @IBOutlet weak var pointTotalLabel: UILabel!
    var duckNum = Int()
    var cactusNum = Int()
    var totDuckNum = Int()
    var totCactusNum = Int()
    
    @IBOutlet weak var totalPointsLeft: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointTotalLabel.text = String(nextVC.pointTotal)
        // Do any additional setup after loading the view.
        checkBase()
        totDuckNum = previousVC.duckArrayLength
        totCactusNum = previousVC.cactusArrayLength
    }
   
    @IBAction func duckBoughtButton(_ sender: UIButton) {
        duckNum += 1
        totDuckNum -= 1
        nextVC.pointTotal -= 50
        pointTotalLabel.text = String(nextVC.pointTotal)
        checkBase()
        checkDuckStock()
    }
    
    @IBAction func cactusBoughtButton(_ sender: UIButton) {
        cactusNum += 1
        totCactusNum -= 1
        nextVC.pointTotal -= 30
        pointTotalLabel.text = String(nextVC.pointTotal)
        checkBase()
        checkCactusStock()

    }
    func checkBase(){
        if nextVC.pointTotal <= 0{
            nextVC.pointTotal = 0
            let alert = UIAlertController(title: "Sorry, you don't have enough points", message: "Go complete more goals to earn more points", preferredStyle: .alert)
            alert.addAction(.init(title: "Ok", style: .default, handler: nil))
            alert.addAction(.init(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    func checkDuckStock(){
        if totDuckNum <= 0{
            let alert = UIAlertController(title: "Sorry, no more ducks", message: "Doobie has left town, Doobie will come back eventually", preferredStyle: .alert)
            alert.addAction(.init(title: "Ok", style: .default, handler: nil))
            alert.addAction(.init(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        
    }
        func checkCactusStock(){
            if totCactusNum <= 0{
                let alert = UIAlertController(title: "Sorry, no more Cactus", message: "Cammie has left town, Cammie will come back eventually", preferredStyle: .alert)
                alert.addAction(.init(title: "Ok", style: .default, handler: nil))
                alert.addAction(.init(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        }
    
    
    // MARK: - Navigation

//    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let rewardsVC = segue.destination as? PointsViewController {
            rewardsVC.shopVC = self
        }

    }
    

}
