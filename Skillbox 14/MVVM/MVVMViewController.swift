//
//  MVVMViewController.swift
//  Skillbox 14
//
//  Created by Артём on 10/31/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class MVVMViewController: UIViewController {
    
    private var viewModel = ViewModel()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toDoTextField: UITextField!
    
//    var taskList = MVVMRealmWork.shared.getItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func addButton(_ sender: Any) {
        
        MVVMRealmWork.shared.save(name: toDoTextField.text ?? "")
        reloadData()
        
    }
    
    private func reloadData() {
        viewModel.taskList = MVVMRealmWork.shared.getItems()
        tableView.reloadData()
        }
}


extension MVVMViewController: UITableViewDataSource, UITableViewDelegate {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MVVMTableViewCell
        
        cell.selectionStyle = .blue
        let task = viewModel.taskList[indexPath.row]
        cell.taskLabel!.text = task.taskName
        cell.accessoryType = task.isChecked ? .checkmark : .none

        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MVVMRealmWork.shared.checkIt(index: indexPath.row)
        reloadData()
    }
    
    
        
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            
            MVVMRealmWork.shared.remove(index: indexPath.row)
            self.reloadData()
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [delete])

        return swipeActions
        
    }
}
    
    
    
    
    
    
    

