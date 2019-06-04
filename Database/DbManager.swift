//
//  DbManager.swift
//  AJDecode
//
//  Created by Tosc189 on 14/03/19.
//  Copyright © 2019 Tosc189. All rights reserved.
//

import UIKit
import SQLite3


public let SQLITE_STATIC = unsafeBitCast(0, to: sqlite3_destructor_type.self)
public let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
public let DatabaseQueue = DispatchQueue(label:"Cardamom.database.queue")
class DbManager: NSObject {
    
    var db:OpaquePointer?
    
    override init() {
        super.init()
        openDatabase()
        createTable()
    }
    
    func createTable() {
        
        createTable(queryString: "create table if not exists userInfo (userId integer primary key autoincrement, Name text,city text, phone text,UNIQUE(userId))")
       
    }
    
    func openDatabase() {
        let databaseName = "test.sqlite"
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fileURL = docDir.appending("/\(databaseName)")
        print(fileURL)
        if sqlite3_open(fileURL, &db) != SQLITE_OK {
            print("error opening database")
        }
    }
    
    
    func createTable(queryString: String)
    {
        let createtable = queryString.cString(using: String.Encoding.utf8)
        if sqlite3_exec(db, createtable, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        else {
            print("table created")
        }
    }


}
