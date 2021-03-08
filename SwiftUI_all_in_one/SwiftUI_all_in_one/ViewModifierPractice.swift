//
//  ViewModifierPractice.swift
//  SwiftUI_all_in_one
//
//  Created by 조종운 on 2021/02/17.
//

import SwiftUI

struct ViewModifierPractice: View {
    
    @State private var fontColor = "red"
    let colors = ["red", "orange", "blue", "purple", "green"]
    
    var body: some View {
        VStack {
            Form{
                Section {
                    Picker("색을 선택하세요", selection: $fontColor) {
                        ForEach(colors, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    HStack {
                        Spacer()
                        Text("\(fontColor)")
                            .conditionColor(color: fontColor)
                        Spacer()
                    }
                    
                }
            }
        }
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

// ZStack을 씌워서 새로운 객체를 반환!
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

struct Prominent: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .font(.system(size: 24))
            .foregroundColor(.blue)
        
    }
}

struct ConditionColor: ViewModifier {
    var color: String
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}

extension View {
    func textStyle() -> some View {
        self.modifier(Title())
    }
    
    func watermark(text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
    
    func prominent() -> some View {
        self.modifier(Prominent())
    }
    
    func conditionColor(color: String) -> some View {
        self.modifier(ConditionColor(color: color))
    }
}

struct ViewModifierPractice_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierPractice()
    }
}
