//
//  ScrollViewWithScrollingData.swift
//  MileStone6
//
//  Created by 조종운 on 2021/03/21.
//

import SwiftUI

struct ScrollViewWithScrollingData: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0 ..< 100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
