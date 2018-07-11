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
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var priorityTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
        guard let title = titleTextField.text, let desc = descriptionTextField.text, let priority = priorityTextField.text, let priorityInt = Int16(priority) else { return }
        dataManager.addTask(title, desc: desc, priority: priorityInt)
        navigationController?.popViewController(animated: true)
        
        
    }
}
