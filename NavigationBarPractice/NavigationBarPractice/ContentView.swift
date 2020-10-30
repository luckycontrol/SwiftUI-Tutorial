//
//  ContentView.swift
//  NavigationBarPractice
//
//  Created by 조종운 on 2020/09/10.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let colors: [Color] = [.orange, .blue, .pink, .purple, .red, .blue, .green]
    
    var body: some View {
        GeometryReader { fullsize in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ..< 50) { index in
                        GeometryReader { geo in
                            Rectangle()
                                .foregroundColor(self.colors[index % 7])
                                .frame(height: 150)
                                .rotation3DEffect(
                                    .degrees(-Double(geo.frame(in: .global).midX - fullsize.size.width / 2) / 10),
                                    axis: (x:0, y:1, z:0)
                            )
                        }
                        .frame(width: 150)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct NavigationBarColor: ViewModifier {
    init(backgroundColor: UIColor, tintColor: UIColor) {
        let colorAppearance = UINavigationBarAppearance()
        colorAppearance.configureWithOpaqueBackground()
        colorAppearance.backgroundColor = backgroundColor
        colorAppearance.titleTextAttributes = [.foregroundColor: tintColor]
        colorAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
        
        UINavigationBar.appearance().standardAppearance = colorAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = colorAppearance
        UINavigationBar.appearance().compactAppearance = colorAppearance
        UINavigationBar.appearance().tintColor = tintColor
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
        self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
