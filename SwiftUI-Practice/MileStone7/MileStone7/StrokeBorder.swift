//
//  StrokeBorder.swift
//  MileStone7
//
//  Created by 조종운 on 2021/03/23.
//

import SwiftUI

struct StrokeBorder: View {
    var body: some View {
//        Circle()
//            .strokeBorder(Color.blue, lineWidth: 40)
        
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(Color.blue, lineWidth: 10)
    }
}

struct StrokeBorder_Previews: PreviewProvider {
    static var previews: some View {
        StrokeBorder()
    }
}
