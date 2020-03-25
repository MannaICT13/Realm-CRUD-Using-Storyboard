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
    
    // Create data to database
    func WriteUser(_ name : String ,_ dept : String){
        
        try! realmInstance.write({
            realmInstance.add(makeUserInit(name, dept))
        })
        
    }
    
    //read data from database
    func retriveUser() -> Results<User>?{
        
        user = realmInstance.objects(User.self)
        return user
        
    }
    
    //delete user
    
    func deleteUser(index : Int){
        
        let user = retriveUser()
        
        
        try! realmInstance.write({
            
            realmInstance.delete(user![index])
        })
        
}
    //update user
    
    func updateUser(_ name : String ,_ dept : String, index:Int){
        
     let user = retriveUser()
        
        try! realmInstance.write({
            
            user![index].name = name
            user![index].dept = dept
            
        })
        
        
     
        
        
    }
    
    
    
    
    
}
