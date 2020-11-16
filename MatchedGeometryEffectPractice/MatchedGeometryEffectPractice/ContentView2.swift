//
//  ContentView2.swift
//  MatchedGeometryEffectPractice
//
//  Created by 조종운 on 2020/10/31.
//

import SwiftUI

struct ContentView2: View {
    
    @State private var offset: CGFloat = 0
    
    @State private var isZoomed = false
    
    @State private var imageOffset: CGFloat = 44
    
    @State private var backgroundOffset: CGFloat = 0
    
    var frame: CGFloat {
        isZoomed ? 300 : 44
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.pink)
                        .frame(width: imageOffset, height: imageOffset)
                        
                    
                    if !isZoomed {
                        Text("Talyor Swift - 1989")
                            .font(.headline)
                        Spacer()
                    }
                }
                
                if isZoomed {
                    Text("Taylor Swift - 1989")
                        .font(.headline)
                        .padding(.bottom, 60)
                }
            }
            .padding()
            .frame(width: backgroundOffset, height: backgroundOffset)
            .background(Color(white: 0.9))
            
        }
    }
    
    func onChanged(value: DragGesture.Value) {
        
    }
    
    func onEnded(value: DragGesture.Value) {
        
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
