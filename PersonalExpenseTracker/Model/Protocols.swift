//
//  Protocols.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 13/03/23.
//

import Foundation

protocol TransactionsContract {
    
    
    var transactionAmount: Int {get set}
    var date: String {get set}
    var description: String {get set}

}
