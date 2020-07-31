//
//  PointsViewController.swift
//  FinalProjectKWK
//
//  Created by Mimi Zhang on 7/30/20.
//  Copyright © 2020 Jessica Dai. All rights reserved.
//

import UIKit

class PointsViewController: UIViewController {
    
    var completeVC = CompleteGoalViewController() // pointTotal
    var shopVC = ShopViewController() // Number of ducks, num of cacti
    
    
    
    @IBOutlet weak var totalPointsLabel: UILabel!
    @IBOutlet weak var totalDucksLabel: UILabel!
    @IBOutlet weak var totalCactusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPointsLabel.text = String(completeVC.pointTotal)
//        // Do any additional setup after loading the view.
//        totalDucksLabel.text = String(shopVC.duckNum)
//        totalCactusLabel.text = String(shopVC.cactusNum)
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

