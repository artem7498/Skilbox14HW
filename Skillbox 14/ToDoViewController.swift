//
//  ToDoViewController.swift
//  Skillbox 14
//
//  Created by Артём on 5/24/20.
//  Copyright © 2020 Artem A. All rights reserved.
// ghbtv ghbtv

import UIKit
import RealmSwift

class ToDoViewController: UIViewController, UITableViewDelegate {
    
    var realm : Realm!
    var tasksList = RealmWork.shared.getItems()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        
        print(tasksList)
        

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var input: UITextField!
    @IBAction func addItem(_ sender: Any) {
        
            let task = Task()
            task.taskName = input.text ?? ""
            RealmWork.shared.save(item: task)
            tasksList = RealmWork.shared.getItems()
           
        
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
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        self.addItem((Any).self)
        let task = tasksList[indexPath.row]
        cell.taskTextLabel!.text = task.taskName
        tableView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            
            realm.beginWrite()
            realm.delete(tasksList[indexPath.row])
            try! realm.commitWrite()
//            let task = tasksList[indexPath.row]
//            try! self.realm.write({self.realm.delete(task)})
//            myTableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
    }
}


