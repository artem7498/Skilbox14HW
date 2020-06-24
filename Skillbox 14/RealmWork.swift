//
//  RealmWork.swift
//  Skillbox 14
//
//  Created by Артём on 5/27/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit
import RealmSwift


class RealmWork {
    
  static let shared = RealmWork()
  
  private let realm = try! Realm()
  
    func getItems() -> Results<Task>{
        realm.objects(Task.self)
    }
    
    func save(name: String) {
        let task = Task()
        task.taskName = name
        try! realm.write {
            realm.add(task)
        }
    }
    
    func checkIt(index: Int) {
        let item = realm.objects(Task.self)[index]
        try! realm.write {
            item.isChecked = !item.isChecked
        }
    }
       
    func remove(index: Int){
        let item = realm.objects(Task.self)[index]
        try! realm.write {
            realm.delete(item)
        }
    }
}
  
  
  
  
