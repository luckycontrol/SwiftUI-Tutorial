//
//  CorrectOrNot.swift
//  MileStone4
//
//  Created by 조종운 on 2021/03/18.
//

import SwiftUI

struct CorrectOrNot: View {
    
    let resultText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 250, height: 250)
                .foregroundColor(resultText == "정답입니다!" ? Color("correct") : Color("wrong"))
            
            Text("\(resultText)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}
