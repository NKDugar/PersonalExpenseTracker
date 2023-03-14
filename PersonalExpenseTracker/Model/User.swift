//
//  User.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 05/03/23.
//

import Foundation

public struct User {
    let name: String
    let emailId: String
    let password: String
    var wallets =  [Wallet]()
   
    init(name: String, emailId: String, password: String) {
        self.name = name
        self.emailId = emailId
        self.password = password
    }

    
    
}

