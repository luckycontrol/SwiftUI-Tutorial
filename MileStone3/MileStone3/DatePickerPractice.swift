//
//  DatePickerPractice.swift
//  MileStone3
//
//  Created by 조종운 on 2021/03/10.
//

import SwiftUI

struct DatePickerPractice: View {
    
    @State private var now = Date()
    
    let now1 = Date()
    let tomorrow = Date().addingTimeInterval(86400)
    
    var body: some View {
        DatePicker("", selection: $now, in: Date()...)
            .labelsHidden()
    }
}

struct DatePickerPractice_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerPractice()
    }
}
