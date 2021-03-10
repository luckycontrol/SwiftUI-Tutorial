//
//  ContentView.swift
//  MileStone2
//
//  Created by 조종운 on 2021/03/09.
//

import SwiftUI

struct GradientPractice: View {
    var body: some View {
        ZStack {
            Color.pink.edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                }
                .frame(width: UIScreen.main.bounds.width, height: 100)
                
                ZStack {
                    RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 5, endRadius: 200)
                }
                .frame(width: UIScreen.main.bounds.width, height: 100)
                
                ZStack {
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                }
                .frame(width: UIScreen.main.bounds.width, height: 100)
            }
            
        }
    }
}
