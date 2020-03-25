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
    
    
    var isUpdate : Bool = false
    var adddetail : User?
   var index = Int()
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
               
        
        if isUpdate{
            
            saveBtnOutletAddUser.setTitle("Update", for: .normal)
            self.title = "UPDATE USER"
            
        }else{
            
            saveBtnOutletAddUser.setTitle("Save", for: .normal)
            self.title = "ADD USER"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextFieldAddUser.text = adddetail?.name
        deptTextFieldAddUser.text = adddetail?.dept
    }
  
    @IBAction func saveBtnAction(_ sender: Any) {
      
        if isUpdate{
            DbHelper.dbInstance.updateUser(nameTextFieldAddUser.text!, deptTextFieldAddUser.text!, index: index)
            self.navigationController?.popViewController(animated: true)
            
        }else{
            DbHelper.dbInstance.WriteUser(nameTextFieldAddUser.text!, deptTextFieldAddUser.text!)
            self.navigationController?.popViewController(animated: true)
        }
     
        
        
    }
    

}
