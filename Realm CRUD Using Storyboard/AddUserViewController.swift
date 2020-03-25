//
//  AddUserViewController.swift
//  Realm CRUD Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 25/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import RealmSwift

class AddUserViewController: UIViewController {

    @IBOutlet weak var nameTextFieldAddUser: UITextField!
    
    @IBOutlet weak var deptTextFieldAddUser: UITextField!
    
    @IBOutlet weak var saveBtnOutletAddUser: UIButton!
    
    

   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "ADD USER"
        
    }
    
  
    @IBAction func saveBtnAction(_ sender: Any) {
      
        DbHelper.dbInstance.WriteUser(nameTextFieldAddUser.text!, deptTextFieldAddUser.text!)
        self.navigationController?.popViewController(animated: true)
        
        
    }
    

}
