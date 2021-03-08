//
//  StepperPractice.swift
//  SwiftUI_all_in_one
//
//  Created by 조종운 on 2021/02/17.
//

import SwiftUI

struct StepperPractice: View {
    
    @State private var sleepAmount = 8.0
    
    @State private var wakeUp = Date()
    
    @State private var count = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.3) {
                        Text("\(sleepAmount, specifier: "%.2f") hours")
                    }
                }
                
                Section {
                    DatePicker("날짜 선택", selection: $wakeUp)
                }
                
                Section {
                    Picker("고르세요", selection: $count) {
                        ForEach(0 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct StepperPractice_Previews: PreviewProvider {
    static var previews: some View {
        StepperPractice()
    }
}
