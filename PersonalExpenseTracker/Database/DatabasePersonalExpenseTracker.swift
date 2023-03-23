//
//  DatabasePersonalExpenseTracker.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 02/03/23.
//

import Foundation
import SQLite3

class Database {
    
    
    
   private  var dbPointer: OpaquePointer?
    
    let filePath = try! FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    func openDatabase() -> OpaquePointer? {
        
        let databaseName = "PersonalExpenseTrackerDatabase.sqlite"
        let databasePath = filePath.appending(component: databaseName)
        
        print("databasePath,path",databasePath.path)
        print("filepath",filePath)
        var dbPointer1: OpaquePointer?
        
        do {
            if sqlite3_open(databasePath.path, &dbPointer1) != SQLITE_OK {
                sqlite3_close(dbPointer1)
                throw DatabaseErrors.openDatabaseFailed
            } else {
                print("Successfully opened the database")
                self.dbPointer = dbPointer1
                return dbPointer1
            }
        } catch {
            print("Error: \(error)")
            return nil
        }
        
    }
    
    func createTable(tableName: String, query: String) -> OpaquePointer? {
        var statementPointer: OpaquePointer? = nil
        
        do {
            guard sqlite3_prepare_v2(dbPointer, query, -1, &statementPointer, nil) == SQLITE_OK else {
                print("Error in query: \n\(query)")
                return nil
            }
            guard sqlite3_step(statementPointer) == SQLITE_DONE else {
                print("Failed to create the table: \(tableName)")
                throw DatabaseErrors.createTablefailed
            }
            print("Successfully created the table: \(tableName)")
            sqlite3_finalize(statementPointer)
            return statementPointer
            
        } catch {
            print("Error: \(error)")
            return nil
        }
        
    }
    
    func insertDataIntoUserTable(user: User)->OpaquePointer? {
        let query = """
                            INSERT INTO USER (NAME,EMAILID,PASSWORD) VALUES (?,?,?)
                            """
        var statementPointer: OpaquePointer? = nil
        guard sqlite3_prepare_v2(dbPointer, query, -1, &statementPointer, nil) == SQLITE_OK else{
            print("error in query  : \(query)")
            return nil
        }
        let name = user.name.cString(using: .utf8)
        let emailId = user.emailId.cString(using: .utf8)
        let password = user.password.cString(using: .utf8)
       
        sqlite3_bind_text(statementPointer, 1, name, -1, nil)
        sqlite3_bind_text(statementPointer, 2, emailId, -1, nil)
        sqlite3_bind_text(statementPointer, 3, password, -1, nil)
        
        guard sqlite3_step(statementPointer) == SQLITE_DONE else{
            print("failed to insertData into table: USER")
            return nil
        }
        print("inserted data successfully in User table")
        sqlite3_finalize(statementPointer)
        return statementPointer
    }
    
    func insertDataIntoWalletTable(wallet: Wallet) -> OpaquePointer? {
        var statementPointer: OpaquePointer? = nil
        let query = "INSERT INTO WALLET (WALLETNAME, WALLETAMOUNT) VALUES (?, ?)"
        guard sqlite3_prepare_v2(dbPointer, query, -1, &statementPointer, nil) == SQLITE_OK else {
            print("error in query: \(query)")
            return nil
        }
        
        let walletname = wallet.walletName.cString(using: .utf8)
        let walletBalance = Int32(wallet.walletBalance)

        sqlite3_bind_text(statementPointer, 1, walletname, -1, nil)
        sqlite3_bind_int(statementPointer, 2, walletBalance)

        guard sqlite3_step(statementPointer) == SQLITE_DONE else {
            print("failed to insert data into table: WALLET")
            return nil
        }
        print("inserted data successfully in Wallet table")
        sqlite3_finalize(statementPointer)
        return statementPointer
    }
    
}
