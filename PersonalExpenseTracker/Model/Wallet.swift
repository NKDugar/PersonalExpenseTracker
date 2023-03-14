//
//  Wallet.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 05/03/23.
//

import Foundation

struct Wallet{
    
    var walletId: String
    var walletName: String
    var walletBalance: Int
    let walletType: WalletType
    var transactions =  [TransactionsContract]()
    
    init(walletId: String, walletName: String, walletBalance: Int, walletType: WalletType, transactions: [TransactionsContract] = [TransactionsContract]()) {
        self.walletId = walletId
        self.walletName = walletName
        self.walletBalance = walletBalance
        self.walletType = walletType
        self.transactions = transactions
    }
    
    
}

