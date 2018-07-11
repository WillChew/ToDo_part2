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
        // get index path of the cell and send as bundle
        if segue.identifier == "detailSegue" {
            
            if let indexPath = tableView.indexPathForSelectedRow{
               
                let detailVC = segue.destination as? DetailViewController
                let task = dataManager.task(at: indexPath)
                detailVC?.detailTitle = task.title
                detailVC?.detailDesc = task.todoDescription
                detailVC?.detailPriority = task.priority
                //            if let customCell = sender as? CustomCellClass,
                //            let detailVC = segue.destination as? DetailViewController {
                //                detailVC.dataManager = dataManager
                //                let task = dataManager.task(at:)
                //                detailVC.detailTitle = customCell.titleLabel.text
                //                detailVC.detailDesc = customCell.descriptionLabel.text
                //                guard let priority = customCell.priorityLabel.text, let priorityInt = Int16(priority) else {return}
                //                detailVC.detailPriority = priorityInt
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


