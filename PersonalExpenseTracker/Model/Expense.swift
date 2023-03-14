//
//  Expense.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 13/03/23.
//

import Foundation

struct Expense: TransactionsContract {
    
    var transactionID: String
    var transactionCategory: TransactionCategory
    var transactionAmount: Int
    var date: String
    var description: String
    let transactionType = "Expense"
    
    init(transactionID: String, transactionCategory: TransactionCategory, transactionAmount: Int , date: String, description: String) {
        self.transactionID = transactionID
        self.transactionCategory = transactionCategory
        self.transactionAmount = transactionAmount
        self.date = date
        self.description = description
    }
}
