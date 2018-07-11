//
//  ViewController.swift
//  Every.Do part 2
//
//  Created by Will Chew on 2018-07-11.
//  Copyright © 2018 Will Chew. All rights reserved.
//

import UIKit

class CustomCellClass: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    
    
    
}

class ViewController: UIViewController {
    
    var dataManager: DataManager!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTaskSegue" {
            if let addVC = segue.destination as? AddViewController {
                addVC.dataManager = dataManager
            }
        }
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.getTaskCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCellClass
        let task = dataManager.task(at: indexPath)
        let priorityStr = String(task.priority)
        
        cell.titleLabel?.text = task.title
        cell.descriptionLabel?.text = task.todoDescription
        cell.priorityLabel.text = priorityStr
        return cell
    }
    
    
    
}


