//
//  Enums.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 14/03/23.
//

import Foundation
import UIKit

enum TransactionCategory: String, CaseIterable {
    
    case FoodAndDrink = "Food And Drink"
    case Shopping = "Shopping"
    case Transport = "Transport"
    case Home = "Home"
    case BillsAndFees = "Bills And Fees"
    case Entertainment = "Entertainment"
    case Car = "Car"
    case Travel = "Travel"
    case HealthCare = "HealthCare"
    case Education = "Education"
    case Groceries = "Groceries"
    case Gifts = "Gifts"
    case SportsAndFitness = "Sports and Fitness"
    case Beauty = "Beauty"
    case Work = "Work"
    case Others = "Others"
    
    
    var image: UIImage?{
            switch self {
            case .FoodAndDrink:
                return UIImage(named: "foodAndDrinkImage")
            case .Shopping:
                return UIImage(named: "shoppingImage")
            case .Transport:
                return UIImage(named: "transportImage")
            case .Home:
                return UIImage(named: "homeImage")
            case .BillsAndFees:
                return UIImage(named: "billsAndFeesImage")
            case .Entertainment:
                return UIImage(named: "entertainmentImage")
            case .Car:
                return UIImage(named: "carImage")
            case .Travel:
                return UIImage(named: "travelImage")
            case .HealthCare:
                return UIImage(named: "healthCareImage")
            case .Education:
                return UIImage(named: "educationImage")
            case .Groceries:
                return UIImage(named: "groceriesImage")
            case .Gifts:
                return UIImage(named: "giftsImage")
            case .SportsAndFitness:
                return UIImage(named: "sportsAndFitnessImage")
            case .Beauty:
                return UIImage(named: "beautyImage")
            case .Work:
                return UIImage(named: "workImage")
            case .Others:
                return UIImage(named: "othersImage")
         
            }
        
        }

}

enum WalletType: String, CaseIterable {
    
    case Cash = "Cash"
    case DebitCard = "Debit Card"
    case CreditCard = "Credit Card"
    
    
    var image: UIImage? {
        switch self {
        case .Cash:
            return UIImage(systemName: "Card")
        case .CreditCard:
            return UIImage(systemName: "Credit card ")
        case .DebitCard:
            return UIImage(named: "Debit card")
       
        }
    }
    
}

enum TransactioType: String,CaseIterable {
    case Income = "Income"
    case Expense = "Expense"
    
}
