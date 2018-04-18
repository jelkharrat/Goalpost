//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Nessin Elkharrat on 4/17/18.
//  Copyright © 2018 practice. All rights reserved.
//

//Storyboard - put the button on top of the uiView so that the button wont disappear after number keyboard appears.


import UIKit
import CoreData

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
        if pointsTxtField.text != "" {
            self.save { (complete) in
                if complete {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func finishGoalBtnWasPressed(_ sender: Any) {
        dismissDetail()
        
    }
    
    
    func save(completion: @escaping Finished) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        //Creating an instance of Goal (entity), and  context so it knows where to save the data
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTxtField.text!)!
        goal.goalProgress = Int32(0)  //value of 0 because progress needs to start at 0
        
        do {
            //save function is a throw. Must be within a do statement
            try managedContext.save()
            print("Saved the data")
            completion(true)
        } catch {
            debugPrint("Could not save \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
