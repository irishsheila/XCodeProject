//
//  AddTaskViewController.swift
//  GoodList
//
//  Created by Sheila Doherty on 3/15/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit

protocol AddTaskViewControllerDelegate {
    func addTaskViewControllerDidSave(task: Task, viewController: UIViewController)
}

class AddTaskViewController: UIViewController, UITextFieldDelegate {
    
    private var titleTextField: UITextField!
    private var prioritySegmentedControl: UISegmentedControl!
    var delegate: AddTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        self.title = "Add New Task"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem.barButtonItemForCancel(target: self, selector: #selector(cancel))
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem.barButtonItemForSave(target: self, selector: #selector(save))
        
        // title textbox
        titleTextField = UITextField()
        titleTextField.placeholder = "Enter task title"
        titleTextField.borderStyle = .roundedRect
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.delegate = self
        
        // segmented control
        prioritySegmentedControl = UISegmentedControl(items: ["High", "Medium","Low"])
        prioritySegmentedControl.selectedSegmentIndex = 1
        prioritySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        prioritySegmentedControl.tintColor = UIColor(displayP3Red: 142/255, green: 68/255, blue: 173/255, alpha: 1.0)
        prioritySegmentedControl.addTarget(self, action: #selector(prioritySelected), for: .valueChanged)
        
        // stackview
        let stackView = UIStackView(arrangedSubviews: [titleTextField, prioritySegmentedControl])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        
        self.view.addSubview(stackView)
        
        // add constraints
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: self.view.frame.width - 20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func save() {
        guard let title = self.titleTextField.text,
            let priority = Priority(rawValue: self.prioritySegmentedControl.selectedSegmentIndex) else {
                return
        }
        
        let task = Task(title: title, priority: priority)
        self.delegate?.addTaskViewControllerDidSave(task: task, viewController: self)
    }
    
    @objc func prioritySelected(segmentedControl: UISegmentedControl) {
        
    }
    
}
