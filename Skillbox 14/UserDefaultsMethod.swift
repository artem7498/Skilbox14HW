//
//  UserDefaults.swift
//  Skillbox 14
//
//  Created by Артём on 5/24/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation


class UserDefaultsMethod {
    
    static let shared = UserDefaultsMethod()
    
    private let kUserNameKey = "UserDefaultsMethod.kUserNameKey"
    
    var userName: String? {
        set { UserDefaults.standard.set(newValue, forKey: kUserNameKey)}
        get { return UserDefaults.standard.string(forKey: kUserNameKey)}
    }
    
    private let kUserLastNameKey = "UserDefaultsMethod.kUserLastNameKey"
    
    var userLastName: String? {
        set { UserDefaults.standard.set(newValue, forKey: kUserLastNameKey)}
        get { return UserDefaults.standard.string(forKey: kUserLastNameKey)}
    }
    
    
    
    
}
