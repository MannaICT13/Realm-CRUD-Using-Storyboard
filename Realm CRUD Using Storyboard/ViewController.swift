//
//  ViewController.swift
//  Realm CRUD Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 24/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddBtn()
    }
    
    func setAddBtn(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(setAddBtnAction(_ :)))
        
    }
    
    
    @objc func setAddBtnAction(_ sender : UIBarButtonItem){
        
        
        
    }
    
    


}

