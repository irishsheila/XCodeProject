//
//  TaskListTableViewController.swift
//  GoodList
//
//  Created by Sheila Doherty on 3/15/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit

class TaskListTableViewController: UITableViewController, AddTaskViewControllerDelegate {
    
    private var tasks = [Task]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        self.title = "GoodList"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let addTaskBarButton = UIBarButtonItem.barButtonItemForAddTask(target: self, selector: #selector(addTaskBarButtonPressed))
        self.navigationItem.rightBarButtonItem = addTaskBarButton
    
    }
    
    @objc func addTaskBarButtonPressed() {
        
        let addTakeVC = AddTaskViewController()
        addTakeVC.delegate = self
        let navC = UINavigationController()
        navC.pushViewController(addTakeVC, animated: true)
        self.present(navC, animated: true, completion: nil)
    }
    
    func addTaskViewControllerDidSave(task: Task, viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
        self.tasks.append(task)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = self.tasks[indexPath.row]
        var cell: TaskTableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as? TaskTableViewCell
        
        if cell == nil {
            cell = TaskTableViewCell(style: .default, reuseIdentifier: "TaskTableViewCell")
        }
        
        cell.titleLabel.text = task.title
        cell.priorityView.setTitle(task.priority.displayTitle, for: .normal)
        return cell
    }
}
