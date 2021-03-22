//
//  GeometryReaderPractice.swift
//  MileStone6
//
//  Created by 조종운 on 2021/03/20.
//

// TODO:
import SwiftUI

struct GeometryReaderPractice: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("practice")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
        }
    }
}
