//
//  personalExpenseTrackerEnums.swift
//  PersonalExpenseTracker
//
//  Created by naveen-pt6301 on 05/03/23.
//

import Foundation

enum DatabaseErrors: Error {
    case openDatabaseFailed
    case createTablefailed
    case inserDataFailed
    case updateDataFailed
}
