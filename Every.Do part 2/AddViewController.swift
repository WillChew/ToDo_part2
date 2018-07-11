//
//  AddViewController.swift
//  Every.Do part 2
//
//  Created by Will Chew on 2018-07-11.
//  Copyright © 2018 Will Chew. All rights reserved.
//

import UIKit



class AddViewController: UIViewController {
    
    var dataManager: DataManager!
    var titleTextField: UITextField!
    var descriptionTextField: UITextField!
    var priorityTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertController = UIAlertController(title: "Create a New Task", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Add", style: .default, handler: self.submitPressed)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alertController.addTextField(configurationHandler: titleTextField)
        alertController.addTextField(configurationHandler: descriptionTextField)
        alertController.addTextField(configurationHandler: priorityTextField)
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        
        self.present(alertController, animated: true, completion: nil)
        
        // Do any additional setup after loading the view.
        
    }
    
    func titleTextField(textField: UITextField!) {
        titleTextField = textField
        titleTextField?.placeholder = "Title"
        titleTextField.text = UserDefaults.standard.string(forKey: "title")
    }
    func descriptionTextField(textField: UITextField!) {
        descriptionTextField = textField
        descriptionTextField?.placeholder = "Description"
        descriptionTextField.text = UserDefaults.standard.string(forKey: "desc")
    }
    func priorityTextField(textField: UITextField!) {
        priorityTextField = textField
        priorityTextField?.placeholder = "Priority"
        priorityTextField.text = UserDefaults.standard.string(forKey: "priority")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func submitButtonPressed(_ sender: UIButton) {
//
//        guard let title = titleTextField.text, let desc = descriptionTextField.text, let priority = priorityTextField.text, let priorityInt = Int16(priority) else { return }
//        dataManager.addTask(title, desc: desc, priority: priorityInt)
//        navigationController?.popViewController(animated: true)
//
//
//    }
    
    func submitPressed(alert: UIAlertAction!) {
        guard let title = titleTextField.text, let desc = descriptionTextField.text, let priority = priorityTextField.text, let priorityInt = Int16(priority) else { return }
        dataManager.addTask(title, desc: desc, priority: priorityInt)
        navigationController?.popViewController(animated: true)
        
        
    }
}
