//
//  ViewController.swift
//  goalpost-app
//
//  Created by Nessin Elkharrat on 4/5/18.
//  Copyright © 2018 practice. All rights reserved.
//

//Core Data Stack

//Core Data is for persistent storage. Allows you to save data regardless of closing an app

//Managed Object Model - pull data model into core data stack

//Managed Object Context - What does all the work. Interact with this most of the time. Keeps a reference to persistent store coordinator

//Persistent Store Coordinator -  Coordinates persistent data in the app. Holds the persistent store that hold all the info that we save. It understands the data model

//To create a core stat stack
//1) Instantiate data model which is used to create the managed object model which is required to create the persistent store coordinator

//2)Then persistent store coordinator is created so it can understand the managed object model

//3) Persistent Store Coordinator creates the persistent store once compatible

import UIKit
import CoreData


class GoalsVC: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        //let goal = Goal()
    }
    @IBAction func addGoalButtonWasPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(createGoalVC)
    }
}

extension GoalsVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create a cell, configure it and pass in data, return cell to tableview
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        cell.configureCell(description: "Eat Kale", type: .shortTerm, goalProgressAmount: 2)
        
        return cell
    }
}

