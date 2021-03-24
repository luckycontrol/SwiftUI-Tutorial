//
//  BlurBlendingAndMore.swift
//  MileStone7
//
//  Created by 조종운 on 2021/03/24.
//

import SwiftUI

struct BlurBlendingAndMore: View {
    var body: some View {
        ZStack {
            Image("test")
                .resizable()
                .frame(width: 300, height: 300)
                .aspectRatio(contentMode: .fit)
            
            Rectangle()
                .fill(Color.white)
                .blendMode(.multiply)
        }
        .frame(width: 300, height: 300)
        .clipped()
    }
}

struct BlurBlendingAndMore_Previews: PreviewProvider {
    static var previews: some View {
        BlurBlendingAndMore()
    }
}
