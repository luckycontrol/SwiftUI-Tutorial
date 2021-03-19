//
//  TestView1.swift
//  iExpense
//
//  Created by 조종운 on 2021/03/19.
//

import SwiftUI

struct TestView1: View {
    
    @Binding var test: Test
    
    var body: some View {
        Text(test.firstName)
        Text(test.lastName)
    }
}
