//
//  DetailTableViewController.swift
//  Realm CRUD Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 25/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var nameLblDetail: UILabel!
    
    @IBOutlet weak var deptLblDetail: UILabel!
    
   // @IBOutlet var tableView: UITableView!
    
    var userDetail : User?
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Detail"
        editBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        nameLblDetail.text = userDetail?.name
        deptLblDetail.text = userDetail?.dept
        tableView.reloadData()
    }
    func editBtn(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editBtnAction(_ :)))
        
    }
    
    
    @objc func editBtnAction(_ sender : UIBarButtonItem){
        
        let addVC = storyboard?.instantiateViewController(identifier: "AddUserViewController") as!  AddUserViewController
       
        addVC.isUpdate = true
        addVC.adddetail = userDetail
        addVC.index = index
       
        self.navigationController?.pushViewController(addVC, animated: true)
        
        
    }

   

}
