//
//  ViewController.swift
//  Realm CRUD Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 24/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    var user : Results<User>?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "USER"
        
        setAddBtn()
        user = DbHelper.dbInstance.retriveUser()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        user = DbHelper.dbInstance.retriveUser()
        tableView.reloadData()
    }
    
    func setAddBtn(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(setAddBtnAction(_ :)))
        
    }
    
    
    @objc func setAddBtnAction(_ sender : UIBarButtonItem){
        
        let addUserVC = self.storyboard?.instantiateViewController(identifier: "AddUserViewController") as! AddUserViewController
        self.navigationController?.pushViewController(addUserVC, animated: true)
        
    }
    
    


}
extension ViewController : UITableViewDataSource,UITableViewDelegate{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return user!.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.nameLblCell.text = user![indexPath.row].name
        cell.deptLblCell.text = user![indexPath.row].dept
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            
            DbHelper.dbInstance.deleteUser(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)

            
        }
        let config = UISwipeActionsConfiguration(actions: [delete])
        config.performsFirstActionWithFullSwipe = false
        return config
        
        
        
    }
    
  
    
    
}
