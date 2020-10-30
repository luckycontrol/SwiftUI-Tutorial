//
//  Stepper.swift
//  swiftui_project4
//
//  Created by 조종운 on 2020/09/06.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct StepperPractice: View {
    
    @State private var stepperAmount = 8.0
    
    var body: some View {
        Stepper(value: $stepperAmount, in: 1...10, step: 2) {
            Text("\(stepperAmount, specifier: "%.2f")")
                .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black.opacity(0.5)))
    }
}

struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
        StepperPractice()
    }
}
