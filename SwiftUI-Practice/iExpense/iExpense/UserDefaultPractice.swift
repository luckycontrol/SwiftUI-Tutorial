//
//  UserDefaultPractice.swift
//  iExpense
//
//  Created by 조종운 on 2021/03/19.
//

import SwiftUI

struct UserDefaultPractice: View {
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button(action: {
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }) {
            Text("Tap Count: \(tapCount)")
        }
    }
}
