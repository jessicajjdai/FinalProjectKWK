//
//  GoalWorldViewController.swift
//  FinalProjectKWK
//
//  Created by Mimi Zhang on 7/30/20.
//  Copyright © 2020 Jessica Dai. All rights reserved.
//

import UIKit

class GoalWorldViewController: UIViewController {
    var previousVC = ShopViewController()
    var duckArray = [Bool]()
    var cactusArray = [Bool]()
    var duckArrayLength = Int()
    var cactusArrayLength = Int()
    
    
    @IBOutlet weak var cactus1: UIButton!
    @IBOutlet weak var cactus2: UIButton!
    @IBOutlet weak var cactus3: UIButton!
    @IBOutlet weak var cactus4: UIButton!
    @IBOutlet weak var cactus5: UIButton!
    @IBOutlet weak var cactus6: UIButton!
    @IBOutlet weak var cactus7: UIButton!
    @IBOutlet weak var cactus8: UIButton!
    
    @IBOutlet weak var duck1: UIButton!
    @IBOutlet weak var duck2: UIButton!
    @IBOutlet weak var duck3: UIButton!
    @IBOutlet weak var duck4: UIButton!
    @IBOutlet weak var duck5: UIButton!
    @IBOutlet weak var duck6: UIButton!
    @IBOutlet weak var duck7: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func duckIsHidden(){
        duckArray = [duck1.isHidden, duck2.isHidden, duck3.isHidden, duck4.isHidden, duck5.isHidden, duck6.isHidden, duck7.isHidden]
        duckArrayLength = duckArray.count
        duckArray[previousVC.duckNum] = false
        duckArray.remove(at: previousVC.duckNum)
        previousVC.duckNum -= 1
    }
    func cactusIsHidden(){
        cactusArray = [cactus1.isHidden, cactus2.isHidden, cactus3.isHidden, cactus4.isHidden, cactus5.isHidden, cactus6.isHidden, cactus7.isHidden, cactus8.isHidden]
        cactusArrayLength = cactusArray.count
        cactusArray[previousVC.cactusNum] = false
        cactusArray.remove(at: previousVC.cactusNum)
        previousVC.cactusNum -= 1
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let shopVC = segue.destination as? ShopViewController {
            shopVC.previousVC = self
        }
    }
    

}
