//
//  ContentView.swift
//  CoursesAppUI_Tutorial
//
//  Created by 조종운 on 2021/02/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CustomTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
