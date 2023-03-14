//
//  DummyData.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 13/03/23.
//

import Foundation

class DummyData {
    
    private init(){
        let shared = DummyData()
    }
    
   func creatingADummyUser() {
        var user = User(name: "naveen ", emailId: "naveen@gmail.com`", password: "12345")
       let wallet =  Wallet(walletId: "1", walletName: "cash", walletBalance: 344, walletType: .Cash)
       user.wallets.append(wallet)
       user.wallets[0].transactions.append(Income(transactionID: "1", transactionCategory: .Travel, transactionAmount: 203, date: "12-03-2023", description: "travel expense"))
   }
    
    
    
    
    
}
