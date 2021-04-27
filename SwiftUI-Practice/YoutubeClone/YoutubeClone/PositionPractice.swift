//
//  PositionPractice.swift
//  YoutubeClone
//
//  Created by 조종운 on 2021/04/27.
//

import SwiftUI

struct PositionPractice: View {
    
    static let rect = UIScreen.main.bounds
    
    static let edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Text("Hello world!")
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color.pink.edgesIgnoringSafeArea(.all))
                
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: geometry.size.width, height: geometry.size.height + PositionPractice.edge!.top + PositionPractice.edge!.bottom)
                    .foregroundColor(.green)
                    .offset(offset)
                    .gesture (
                        DragGesture()
                            .onChanged { value in
                                offset = value.translation
                            }
                    )
                    .zIndex(1)
            }
        }
    }
}

struct PositionPractice_Previews: PreviewProvider {
    static var previews: some View {
        PositionPractice()
    }
}
