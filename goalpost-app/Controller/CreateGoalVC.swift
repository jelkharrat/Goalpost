//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by Nessin Elkharrat on 4/8/18.
//  Copyright © 2018 practice. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
    //Outlets
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //moves button with keyboard
        nextBtn.bindToKeyboard()
        
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        
        goalTextView.delegate = self
    }
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        longTermBtn.setDeselectedColor()
        shortTermBtn.setSelectedColor()
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            //make sure identifier is set to "FinishGoalVC" in storyboard
            //need to cast as type FinishGoalVC or else it wont go into initData function
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else { return }
            //Optional, so need to force unwrap
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            
            presentDetail(finishGoalVC)
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
