//
//  MVVMRealmModel.swift
//  Skillbox 14
//
//  Created by Артём on 10/31/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation
import RealmSwift


class MVVMRealmWork {
    
  static let shared = MVVMRealmWork()
  
  private let realm = try! Realm()
  
    func getItems() -> Results<MVVMTask>{
        realm.objects(MVVMTask.self)
    }
    
    func save(name: String) {
        let task = MVVMTask()
        task.taskName = name
        try! realm.write {
            realm.add(task)
        }
    }
    
    func checkIt(index: Int) {
        let item = realm.objects(MVVMTask.self)[index]
        try! realm.write {
            item.isChecked = !item.isChecked
        }
    }
    
//    func editTaskName(newName: String, index: Int){
//        let item = realm.objects(MVVMTask.self)[index]
//        try! realm.write {
//            item.taskName = newName
//        }
        
//    }
       
    func remove(index: Int){
        let item = realm.objects(MVVMTask.self)[index]
        try! realm.write {
            realm.delete(item)
        }
    }
}
