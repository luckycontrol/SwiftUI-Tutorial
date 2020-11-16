//
//  ContentView.swift
//  MatchedGeometryEffectPractice
//
//  Created by 조종운 on 2020/10/31.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isZoomed = false
    
    @Namespace private var animation
    
    var frame: CGFloat {
        isZoomed ? 300 : 44
    }
    
    var body: some View {
        VStack {
            if !isZoomed {
                Spacer()
            }
            
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: frame, height: frame)
                        .padding(.top, isZoomed ? 20 : 0)
                    
                    if isZoomed == false {
                        Text("Taylor Swift - 1989")
                            .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                            .font(.headline)
                        Spacer()
                    }
                }
                
                if isZoomed == true {
                    Text("Taylor Swift - 1989")
                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                        .font(.headline)
                        .padding(.bottom, 60)
                    
                    Text("가느다란마법사")
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    isZoomed.toggle()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: isZoomed ? UIScreen.main.bounds.height : 60)
            .background(Color(white: 0.9))
            .edgesIgnoringSafeArea(isZoomed ? .all : .bottom)
            
            if isZoomed {
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
