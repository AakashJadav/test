//
//  UserInfo.swift
//  AJDecode
//
//  Created by Tosc189 on 14/03/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import UIKit
import SQLite3
class UserInfo: NSObject {

    var strName:String = ""
    var city:String = ""
    var phoneno:String = ""
    var userId : String = ""
    let appdel = UIApplication.shared.delegate as! AppDelegate
    
    func insertRecord(_ userInfo : UserInfo) -> Bool {
        var isstatus = false
        
        
        let query = "insert into userInfo(Name,city,phone) values(?,?,?)"
        var statement : OpaquePointer?
        
        if sqlite3_prepare(appdel.dbMan.db, query, -1, &statement, nil) == SQLITE_OK {
            
            var i : Int32 = 1
            sqlite3_bind_text(statement,i,userInfo.strName, -1, SQLITE_TRANSIENT)
            i+=1
            sqlite3_bind_text(statement, i, userInfo.city, -1, SQLITE_TRANSIENT)
            i+=1
            sqlite3_bind_text(statement, i, userInfo.phoneno, -1, SQLITE_TRANSIENT)
            
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("record insert successfully")
                isstatus = true
            }
            else {
                let errmsg = String(cString: sqlite3_errmsg(appdel.dbMan.db)!)
                print("Error Account Info update data into Database: \(errmsg)")
                isstatus = false
            }
        }
        sqlite3_finalize(statement)
        return isstatus
    }
    
    
    func deleteRecordBy(id: String) -> Bool {
        
        let query = "delete from userInfo where userId='\(id)'"
        
        if sqlite3_exec(appdel.dbMan.db, query, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(appdel.dbMan.db)!)
            print("Error Deleting Record: \(errmsg)")
            return false
        }else{
            print("Deleting Record SuccessFully")
            return true
        }
    }
    
    
    func getuserByName( _ name : String) -> UserInfo {
        var statement : OpaquePointer?
        let query = "select userId, Name , city , phone from userInfo where Name='\(name)'"
        var userinfo = UserInfo()
        if sqlite3_prepare_v2(appdel.dbMan.db, query, -1, &statement, nil) == SQLITE_OK {
               while sqlite3_step(statement) == SQLITE_ROW {
                
                
                if let userId = sqlite3_column_text(statement, 0)
                {
                    userinfo.userId =  String(cString: userId)
                }
                else {
                    userinfo.userId = ""
                }
            if let name = sqlite3_column_text(statement, 1)
            {
                userinfo.strName =  String(cString: name)
            }
            else {
                userinfo.strName = ""
            }
           
            if let city = sqlite3_column_text(statement, 2)
            {
                userinfo.city = String(cString: city)
                
            }
            else {
                userinfo.city = ""
            }
            
            if let phone = sqlite3_column_text(statement, 3){
                userinfo.phoneno = String(cString: phone)
            }
            else{
                userinfo.phoneno = ""
            }
                return userinfo
            }
                
                let errmsg = String(cString: sqlite3_errmsg(self.appdel.dbMan.db)!)
                print("Error finalizing prepared statement: \(errmsg)")
            
            if sqlite3_finalize(statement) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(appdel.dbMan.db)!)
                print("Error finalizing prepared statement: \(errmsg)")
            }
            statement = nil
            
        }
        print(userinfo)
        return userinfo
    }
    
    
    func updateRecords( _ userinfo : UserInfo) ->  Bool {
        
       var isstatus = false

        let query = "UPDATE userInfo set Name='\(userinfo.strName)' , city = '\(userinfo.city)' , phone = '\(userinfo.phoneno)' where userId = '\(userinfo.userId)' "
        var statement : OpaquePointer?

        if sqlite3_prepare_v2(appdel.dbMan.db, query, -1, &statement, nil) == SQLITE_OK {

            if sqlite3_step(statement) == SQLITE_OK {
                isstatus = true
            }
            else {
                let errmsg = String(cString: sqlite3_errmsg(appdel.dbMan.db)!)
                print("Error into update Database: \(errmsg)")
                isstatus = false
            }
        }
        sqlite3_finalize(statement)
       return isstatus
    }
    
    
    func getUserRecords() -> [UserInfo] {
        
        var statement : OpaquePointer?
        
        let query = "select userId ,Name, city , phone from userInfo "
        
        var arrUserInfo = [UserInfo]()
        
        if sqlite3_prepare_v2(appdel.dbMan.db, query, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let userinfo = UserInfo()
                
                if let userid = sqlite3_column_text(statement, 0){
                    userinfo.userId = String(cString: userid)
                }
                else {
                    userinfo.userId = ""
                }
                
               // var i : Int32 = 1
                if let name = sqlite3_column_text(statement, 1){
                    userinfo.strName = String(cString: name)
                }
                else{
                    userinfo.strName = ""
                }
              //  i += 1
                
                if let city = sqlite3_column_text(statement, 2)
                {
                    userinfo.city = String(cString: city)
                    
                }
                else{
                    userinfo.city = ""
                }
               // i+=1
                
                if let phone = sqlite3_column_text(statement, 3)
                {
                    userinfo.phoneno = String(cString: phone)
                }
                else{
                    userinfo.phoneno =  ""
                }
                
                arrUserInfo.append(userinfo)
            }
        }
        
        if sqlite3_finalize(statement) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(appdel.dbMan.db)!)
            print("Error finalizing prepared statement: \(errmsg)")
        }
        statement = nil
        print(arrUserInfo)
        return arrUserInfo
    }
    
    
}
