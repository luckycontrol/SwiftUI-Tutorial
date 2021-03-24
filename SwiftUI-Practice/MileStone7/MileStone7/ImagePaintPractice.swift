//
//  ImagePaintPractice.swift
//  MileStone7
//
//  Created by 조종운 on 2021/03/24.
//

import SwiftUI

struct ImagePaintPractice: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .frame(width: 300, height: 300)
//            .background(Image("test"))
        
//        Text("Hello World!")
//            .frame(width: 300, height: 300)
//            .border(ImagePaint(image: Image("test"), scale: 0.2), width: 30)
        
//        Text("Hello World!")
//            .frame(width: 300, height: 300)
//            .border(ImagePaint(image: Image("test"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
        
        Capsule()
            .strokeBorder(ImagePaint(image: Image("test"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 300)
    }
}

struct ImagePaintPractice_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintPractice()
    }
}
