//
//  TestView2.swift
//  iExpense
//
//  Created by 조종운 on 2021/03/19.
//

import SwiftUI

struct TestView2: View {
    
    @Binding var test: Test
    
    var body: some View {
        VStack {
            TextField("test1", text: $test.firstName)
            TextField("test2", text: $test.lastName)
            Text(test.firstName)
            Text(test.lastName)
        }
    }
}
