//
//  TemperatureConversion.swift
//  MileStone1
//
//  Created by 조종운 on 2021/03/09.
//

import SwiftUI

struct TemperatureConversion: View {
    
    @State private var temp = ""
    
    @State private var selectedTemp = 0
    
    private let temps = ["화씨", "섭씨", "켈빈"]
    
    private var calTempMethods: [String] {
        return temps.filter {
            $0 != temps[selectedTemp]
        }
    }
    
    private var resultTemp: [String: Double] {
        
        let inputTemp = Double(temp) ?? 0
        let result: [String: Double]
        
        if temps[selectedTemp] == "섭씨" {
            result = celsius(inputTemp)
        }
        
        else if temps[selectedTemp] == "화씨" {
            result = fahrenheit(inputTemp)
        }
        
        else {
            result = kelvin(inputTemp)
        }
        
        return result
    }
    
    func fahrenheit(_ n: Double) -> [String: Double] {
        let cel = (n - 32) * 5/9
        let kel = (n - 32) * 5/9 + 273.15
        
        return ["섭씨": cel, "캘빈": kel]
    }
    
    func celsius(_ n: Double) -> [String: Double] {
        let fah = (n * 9/5) + 32
        let kel = n + 273.15
        
        return ["화씨": fah, "캘빈": kel]
    }
    
    func kelvin(_ n: Double) -> [String: Double] {
        let cel = n - 273.15
        let fah = (n - 273.15) * 9/5 + 32
        
        return ["섭씨": cel, "화씨": fah]
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("온도 측정 방식", selection: $selectedTemp) {
                        ForEach(0 ..< temps.count) {
                            Text("\(temps[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    TextField("온도를 입력하세요.", text: $temp)
                        .keyboardType(.decimalPad)
                }
                
                ForEach([String](resultTemp.keys), id:\.self) { resultKey in
                    Section {
                        Text("\(temps[selectedTemp]) \(temp)를 \(resultKey)(으)로 바꾼 결과: \(resultTemp[resultKey]!, specifier: "%.2f")")
                    }
                }
            }
            .navigationTitle("온도 변환기")
        }
    }
}
