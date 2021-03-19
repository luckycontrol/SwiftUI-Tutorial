//
//  UserDefaults.swift
//  iExpense
//
//  Created by 조종운 on 2021/03/19.
//

import SwiftUI

struct UserDefaults: View {
    
    @State private var tapCount = 0
    
    var body: some View {
        Button(action: { tapCount += 1 }) {
            Text("Tap Count: \(tapCount)")
            
        }
    }
}
