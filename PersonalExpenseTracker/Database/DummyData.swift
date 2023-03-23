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
    static var userDetails = [String : User]()
    
    private var datesAndTransaction = [String : [TransactionsContract]]()
    
    func addDummy(){
        
       
        var user = User(name: "naveen", emailId: "naveen@gmail.com", password: "12345")
        var wallet = Wallet(walletName: "Wallet1", walletBalance: 1000, walletType: .Cash)
        
        user.addWallet(wallet: wallet)
        
        let transaction1 = Income(transactionCategory: .Loan, transactionAmount: 1000, date: "12-03-2023", description: "income - loan")
        let transaction2 = Expense(transactionCategory: .HealthCare, transactionAmount: 2000, date: "12-03-2023", description: "expense - healthcare")
        
        wallet.addTransaction(transaction: transaction1)
        wallet.addTransaction(transaction: transaction2)
        
        
        
        
        
    }
}
