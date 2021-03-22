//
//  MVVMRealmModel.swift
//  Skillbox 14
//
//  Created by Артём on 10/31/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation
import RealmSwift


class MVVMTask: Object {
    
    @objc dynamic var taskName = ""
    @objc dynamic var isChecked = false
}
