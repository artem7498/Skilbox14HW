//
//  RealmMethod.swift
//  Skillbox 14
//
//  Created by Артём on 5/25/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation
import RealmSwift


class Task: Object {
    
    dynamic var taskName = ""
    
    func test() {
    let dog = Task()
    dog.taskName = "Eat something"
        
        try! realm?.write { realm!.add(dog)}
    }
}


