//
//  ToDoViewController.swift
//  Skillbox 14
//
//  Created by Артём on 5/24/20.
//  Copyright © 2020 Artem A. All rights reserved.


import UIKit

class ToDoViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
   
    var tasksList = RealmWork.shared.getItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tasksList)
    }
    
    @IBOutlet weak var input: UITextField!
    @IBAction func addItem(_ sender: Any) {
        RealmWork.shared.save(name: input.text ?? "")
        reloadData()
        }
    
    func editButtonDidClick(index: Int) {
        let alertController = UIAlertController(title: "Edit Task", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {
            alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            let newTaskName = textField.text ?? ""
            RealmWork.shared.editTaskName(newName: newTaskName, index: index)
            self.reloadData()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "New Task Text"
        })
        self.present(alertController, animated: true, completion: nil)
    }
        
    private func reloadData() {
        tasksList = RealmWork.shared.getItems()
        tableView.reloadData()
        }
}
    
    
extension ToDoViewController: UITableViewDataSource {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ToDoCell
        
        cell.selectionStyle = .blue
        let task = tasksList[indexPath.row]
        cell.taskTextLabel!.text = task.taskName
        cell.accessoryType = task.isChecked ? .checkmark : .none

        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        RealmWork.shared.checkIt(index: indexPath.row)
        reloadData()
    }
        
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            
            RealmWork.shared.remove(index: indexPath.row)
            self.reloadData()
        }
        let edit = UIContextualAction(style: .normal, title: "Edit") {  (contextualAction, view, boolValue) in
            self.editButtonDidClick(index: indexPath.row)
            self.reloadData()
        }
        edit.backgroundColor = .gray
        
        let swipeActions = UISwipeActionsConfiguration(actions: [delete, edit])

        return swipeActions
        
    }
}


