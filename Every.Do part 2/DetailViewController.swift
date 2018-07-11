//
//  DetailViewController.swift
//  Every.Do part 2
//
//  Created by Will Chew on 2018-07-11.
//  Copyright © 2018 Will Chew. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailTitle: String?
    var detailDesc: String?
    var detailPriority: Int16 = 0
    var dataManager: DataManager!
    
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailPriorityLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitleLabel.text = detailTitle
        detailPriorityLabel.text = String(detailPriority)
        detailDescriptionLabel.text = detailDesc
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
