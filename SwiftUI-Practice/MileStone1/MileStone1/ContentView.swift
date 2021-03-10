//
//  ContentView.swift
//  MileStone1
//
//  Created by 조종운 on 2021/03/08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userName = ""
    
    private let students = ["Harry", "Hermione", "Ron"]
    
    @State private var selectedStudent = 0
    
    @State private var checkAmount = ""
    
    @State private var numberOfPeople = 0
    
    @State private var tipPercentage = 0
    
    private let tipPercentages = [10, 15, 20, 25, 0]
    
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello World!")
                    Text("Hello World!")
                    Text("Hello World!")
                }
                
                Section {
                    Text("Hello World!")
                    Text("Hello World!")
                    Text("Hello World!")
                }
                
                Section {
                    Picker("원하는 사람을 선택해보세요.", selection: $selectedStudent) {
                        ForEach(0 ..< students.count) {
                            Text(students[$0])
                        }
                    }
                    Text("선택된 학생: \(students[selectedStudent])")
                }
                
                Section {
                    TextField("이름을 입력해주세요.", text: $userName)
                    Text("\(userName)")
                }
                
                Section {
                    TextField("양", text:$checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("사람 수", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) { count in
                            Text("\(count) 명")
                        }
                    }
                    
                    Picker("팁 퍼센트", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) { tip in
                            Text("\(tipPercentages[tip])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle(Text("Hello World!"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
