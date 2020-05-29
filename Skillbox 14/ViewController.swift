//
//  ViewController.swift
//  Skillbox 14
//
//  Created by Артём on 5/24/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaultsMethod.shared.userName ?? "ничего не найдено")
        print(UserDefaultsMethod.shared.userLastName ?? "ничего не найдено")
        // Do any additional setup after loading the view.
    }
    
    var name: String = ""
    var lastName: String = ""
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        let name = nameTextField.text!
        let lastName = lastNameTextField.text!
        
        UserDefaultsMethod.shared.userName = name
        UserDefaultsMethod.shared.userLastName = lastName
        
        print("имя изменено на \(String(describing: UserDefaultsMethod.shared.userName))" )
        print("фамилия изменена на \(String(describing: UserDefaultsMethod.shared.userLastName))"  )

    }
    

}

