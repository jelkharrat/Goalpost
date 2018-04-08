//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by Nessin Elkharrat on 4/8/18.
//  Copyright © 2018 practice. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    //Outlets
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
