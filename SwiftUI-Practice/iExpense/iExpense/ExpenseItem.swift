//
//  ExpenseItem.swift
//  iExpense
//
//  Created by 조종운 on 2021/03/19.
//

import SwiftUI

struct ExpenseView: View {
    
    @ObservedObject var expenses: Expenses
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.id) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: deleteRow)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        expenses.showingAddView.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                    }
            )
        }
    }
    
    func deleteRow(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Int
}

class Expenses: ObservableObject {
    
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    @Published var showingAddView = false
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}
