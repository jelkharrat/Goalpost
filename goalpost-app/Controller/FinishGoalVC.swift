//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Nessin Elkharrat on 4/17/18.
//  Copyright © 2018 practice. All rights reserved.
//

//Storyboard - put the button on top of the uiView so that the button wont disappear after number keyboard appears.


import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    //Outlets
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTxtField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    //Take in the description and the goal type
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTxtField.delegate = self
    }
    
    //Pass Data into Core Data Goal Model
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        
    }
    
}
