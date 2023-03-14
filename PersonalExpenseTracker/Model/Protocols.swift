//
//  Protocols.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 13/03/23.
//

import Foundation

protocol TransactionsContract {
    
    var transactionID: String {get set}
    var transactionAmount: Int {get set}
//    var walletType: String{get set}
    var date: String {get set}
    var description: String {get set}
    var transactionCategory: TransactionCategory {get set}
   
    
    
}
