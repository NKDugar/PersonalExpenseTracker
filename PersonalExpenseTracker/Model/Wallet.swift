//
//  Wallet.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 05/03/23.
//

import Foundation

struct Wallet{
    
    var walletName: String
    var walletBalance: Int
    let walletType: WalletType
    var transactionId: Int = 0
    var transactions =  [TransactionsContract]()
    
    init(walletName: String, walletBalance: Int, walletType: WalletType) {
      
        self.walletName = walletName
        self.walletBalance = walletBalance
        self.walletType = walletType
        
    }
    
    mutating func addTransaction(transaction: TransactionsContract){
        transactions.append(transaction)
        transactionId += 1
    }

}

