//
//  Sheet.swift
//  iExpense
//
//  Created by 조종운 on 2021/03/19.
//

import SwiftUI

struct Sheet: View {
    
    @State private var isShowing = false
    
    var body: some View {
        Button(action: { isShowing.toggle() }) {
            Text("Show Sheet")
        }
        .sheet(isPresented: $isShowing) {
            SecondView(name: "ho w")
        }
    }
}

struct SecondView: View {
    
    let name: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button("Dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
