//
//  AddView.swift
//  iExpense
//
//  Created by 조종운 on 2021/03/20.
//

import SwiftUI

struct AddView: View {
    
    @State private var name = ""
    
    @State private var type = "Personal"
    
    @State private var amount = ""
    
    let types = ["Business", "Personal"]
    
    @ObservedObject var expenses: Expenses
    
    var body: some View {
        NavigationView {
            Form {
                TextField("name: ", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("amount: ", text: $amount)
                    .keyboardType(.numbersAndPunctuation)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        if let actualAmount = Int(amount) {
                                            let item = ExpenseItem(name: name, type: type, amount: actualAmount)
                                            expenses.items.append(item)
                                            
                                            expenses.showingAddView = false
                                        }
                                    }) {
                                        Text("Save")
                                    }
            )
        }
    }
}

