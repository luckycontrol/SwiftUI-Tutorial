//
//  StepperPractice.swift
//  MileStone3
//
//  Created by 조종운 on 2021/03/10.
//

import SwiftUI

struct StepperPractice: View {
    
    @State private var amount = 8.0
    
    var body: some View {
        Stepper(value: $amount, in: 4...12, step: 0.25) {
            Text("\(amount, specifier: "%.2f")")
        }
    }
}

struct StepperPractice_Previews: PreviewProvider {
    static var previews: some View {
        StepperPractice()
    }
}
