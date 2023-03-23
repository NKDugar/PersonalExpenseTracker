//
//  Expense.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 13/03/23.
//

import Foundation

struct Expense: TransactionsContract {
      
    
    var transactionCategory: ExpenseCategory
    var transactionAmount: Int
    var date: String
    var description: String
    let transactionType = "Expense"
    
    init(transactionCategory: ExpenseCategory, transactionAmount: Int , date: String, description: String) {
        
        self.transactionCategory = transactionCategory
        self.transactionAmount = transactionAmount
        self.date = date
        self.description = description
    }
    
    
}
