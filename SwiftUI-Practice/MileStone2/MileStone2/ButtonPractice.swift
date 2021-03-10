//
//  ButtonPractice.swift
//  MileStone2
//
//  Created by 조종운 on 2021/03/09.
//

import SwiftUI

struct ButtonPractice: View {
    var body: some View {
        Button(action: {
            print("수정하기 버튼을 누르셨네요")
        }) {
            HStack(spacing: 10) {
                Image(systemName: "pencil")
                    .foregroundColor(.pink)
                Text("수정하기")
            }
        }
    }
}

// Int.random(in: 0...2)
// 리스트.shuffle()

struct ButtonPractice_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPractice()
    }
}
