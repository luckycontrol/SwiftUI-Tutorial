//
//  iExpenseApp.swift
//  iExpense
//
//  Created by 조종운 on 2021/03/19.
//

import SwiftUI

@main
struct iExpenseApp: App {
    
    @ObservedObject var expenses = Expenses()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            Sheet()
//            UsingOnDelete()
//            UserDefaultPractice()
            ExpenseView(expenses: expenses)
                .sheet(isPresented: $expenses.showingAddView) {
                    AddView(expenses: expenses)
                }
        }
    }
}
