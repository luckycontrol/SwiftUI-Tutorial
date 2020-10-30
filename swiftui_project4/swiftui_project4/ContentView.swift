//
//  ContentView.swift
//  swiftui_project4
//
//  Created by 조종운 on 2020/09/06.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("언제 일어날꺼야?")
                    .font(.headline)
                
                DatePicker("언제 일어날지 정하세요", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount, specifier: "%g") hours")
                }
                
                Stepper(value: $coffeeAmount, in: 1...20) {
                    if coffeeAmount == 1{
                        Text("\(coffeeAmount) cup")
                    } else {
                        Text("\(coffeeAmount) cups")
                    }
                }
            }
            .navigationBarTitle("BetterRest")
            .navigationBarItems(trailing:
                Button(action: calculateBedtime) {
                    Text("Calculate")
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("알겠어요")))
                }
            )
        }
    }
    
    func calculateBedtime() {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .short
            
            alertMessage = dateFormatter.string(from: sleepTime)
            alertTitle = "당신이 자야하는 시간은.."
        } catch {
            alertTitle = "에러!"
            alertMessage = "계산하는데 에러가 발생했습니다!"
        }
        
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
