//
//  TaskViewController.swift
//  Tasks App
//
//  Created by Garvit Budhiraja on 15/03/2024.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    var count: Int = 0
    var currentPosition: Int = 0
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
        
        guard var newCount = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        newCount -= 1
        
        UserDefaults().setValue(newCount, forKey: "count")
        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }
}
