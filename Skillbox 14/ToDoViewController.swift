//
//  ToDoViewController.swift
//  Skillbox 14
//
//  Created by Артём on 5/24/20.
//  Copyright © 2020 Artem A. All rights reserved.


import UIKit
import RealmSwift

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
//        let task = tasksList[indexPath.row]
//        let realm = try! Realm()
//        try! realm.write{
//            task.checked = !task.checked
        RealmWork.shared.checkIt(index: indexPath.row)
//        }
        reloadData()
            
            
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {

            RealmWork.shared.remove(index: indexPath.row)
            reloadData()

        }
    }
}


