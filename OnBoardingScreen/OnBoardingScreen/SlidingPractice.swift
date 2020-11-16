//
//  SlidingPractice.swift
//  OnBoardingScreen
//
//  Created by 조종운 on 2020/11/15.
//

import SwiftUI

struct SlidingPractice: View {
    
    @State private var maxWidth = UIScreen.main.bounds.width - 100
    
    @State private var offset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                ZStack {
                    Capsule()
                        .fill(Color.white.opacity(0.1))
                    
                    Text("SWIPE")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    HStack {
                        Circle()
                            .fill(Color("red"))
                            .frame(width: calculateWidth() + 65)
                        
                        Spacer()
                    }
                    
                    HStack {
                        ZStack {
                            Image(systemName: "chevron.right")
                            Image(systemName: "chevron.right")
                                .offset(x: -10)
                        }
                        .frame(width: 65, height: 65)
                        .foregroundColor(.white)
                        .background(Color("red"))
                        .clipShape(Circle())
                        .offset(x: offset)
                        .gesture(DragGesture()
                                    .onChanged(onChange(value:))
                                    .onEnded(onEnded(value:))
                        )
                        
                        Spacer()
                    }
                }
                .frame(width: maxWidth, height: 65)
            }
        }
    }
    
    func calculateWidth() -> CGFloat {
        return offset / maxWidth * maxWidth
    }
    
    func onChange(value: DragGesture.Value) {
        if value.translation.width > 0 && offset <= maxWidth - 65 {
            offset = value.translation.width
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        
    }
}

struct SlidingPractice_Previews: PreviewProvider {
    static var previews: some View {
        SlidingPractice()
    }
}
