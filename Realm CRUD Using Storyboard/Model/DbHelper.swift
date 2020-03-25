//
//  DbHelper.swift
//  Realm CRUD Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 25/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import RealmSwift

class DbHelper {
    
    static let dbInstance = DbHelper()
    let realmInstance = try! Realm()
    
    var user : Results<User>?
    
    
    func makeUserInit(_ name : String ,_ dept : String) -> User{
        
        let newUser = User()
        newUser.name = name
        newUser.dept = dept
        
        return newUser
        
    }
    
    
    func WriteUser(_ name : String ,_ dept : String){
        
        try! realmInstance.write({
            realmInstance.add(makeUserInit(name, dept))
        })
        
    }
    
    
    func retriveUser() -> Results<User>?{
        
        user = realmInstance.objects(User.self)
        return user
        
    }
    
    
    
    
    
    
}
