//
//  DummyData.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 13/03/23.
//

import Foundation

class DummyData {
    
    private init(){
        
    }
    
    static let shared = DummyData()
    static var datesAndExpenses = [String:[TransactionsContract]]()
    
    
    func addDummy(){
        
        DummyData.datesAndExpenses["12-03-2023"] = [Expense(transactionID: "1", transactionCategory: .HealthCare, transactionAmount: 1100, date: "12-03-2023", description: "medical expense"),Expense(transactionID: "2", transactionCategory: .Education, transactionAmount: 1300, date: "12-03-2023", description: "education expense"),Expense(transactionID: "3", transactionCategory: .Others, transactionAmount: 1500, date: "12-03-2023", description: "other expense")]
        
        DummyData.datesAndExpenses["13-03-2023"] = [Expense(transactionID: "1", transactionCategory: .HealthCare, transactionAmount: 1100, date: "13-03-2023", description: "medical expense"),Expense(transactionID: "2", transactionCategory: .Education, transactionAmount: 1300, date: "13-03-2023", description: "education expense"),Expense(transactionID: "3", transactionCategory: .Others, transactionAmount: 1500, date: "13-03-2023", description: "other expense"),Expense(transactionID: "4", transactionCategory: .HealthCare, transactionAmount: 1700, date: "13-03-2023", description: "medical expense"),Expense(transactionID: "5", transactionCategory: .Education, transactionAmount: 1900, date: "13-03-2023", description: "education expense"),Expense(transactionID: "6", transactionCategory: .Others, transactionAmount: 2100, date: "13-03-2023", description: "other expense")]
        
        
    }
}
