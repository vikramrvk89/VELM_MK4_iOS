//
//  DatabaseHandler.swift
//  VELMK4
//
//  Created by R VIKRAM on 10/08/18.
//  Copyright © 2018 R VIKRAM. All rights reserved.
//

import Foundation
import UIKit
import FMDB

let sharedInstance = DatabaseHandler()

class DatabaseHandler: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> DatabaseHandler
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path:Util.getPath("VELMMK4.sqlite"))
        }
        return sharedInstance
    }
    
    func InsertUser(username: String,password:String) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO userdata (username, password) VALUES (?,?)", withArgumentsIn: [username,password])
        sharedInstance.database!.close()
        print("isinserted \(isInserted)")
        
        return isInserted
    }
    
    func verifyUser(username: String,password:String) -> Bool
    {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM userdata WHERE username=? and password=?", withArgumentsIn: [username,password])
        
        
        if (resultSet != nil)
        {
            while resultSet.next()
            {
                
                return true
            }
            
        }
        sharedInstance.database!.close()
        return false
    }
    
    func checkUser(username: String) -> Bool
    {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM userdata WHERE username=?", withArgumentsIn: [username])
        
        
        if (resultSet != nil)
        {
            while resultSet.next()
            {
                
                return true
            }
            
        }
        sharedInstance.database!.close()
        return false
    }
    
    func getAllUsers() -> [String] {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT username FROM userdata ", withArgumentsIn: [])
        
        var userInfo = [String]()
        var i:Int = 0;
        if (resultSet != nil)
        {
            while resultSet.next()
            {
                //TempBeaconInfo.add(resultSet.string(forColumn: "username"))
                userInfo.insert(resultSet.string(forColumn: "username")!, at: i)
                i = i + 1
            }
        }
        
        sharedInstance.database!.close()
        return userInfo
    }
    
    
    
}



