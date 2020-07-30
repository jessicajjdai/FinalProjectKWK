//
//  ShopViewController.swift
//  FinalProjectKWK
//
//  Created by Mimi Zhang on 7/30/20.
//  Copyright © 2020 Jessica Dai. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {
    var duckNum = Int()
    var cactusNum = Int()
    
    @IBOutlet weak var totalPointsLeft: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func duckBoughtButton(_ sender: UIButton) {
        duckNum += 1
//      totalPoints -= 50
    }
    
    @IBAction func cactusBoughtButton(_ sender: UIButton) {
        cactusNum += 1
//      totalPoints -= 30
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
