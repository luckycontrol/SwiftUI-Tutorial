//
//  ContentView.swift
//  OnBoardingScreen
//
//  Created by 조종운 on 2020/10/30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Home = false
    
    var body: some View {
        ZStack {
            if Home {
                Text("Home Screen")
            } else {
                OnBoardScreen()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("Success")), perform: { _ in
            withAnimation { Home = true }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
