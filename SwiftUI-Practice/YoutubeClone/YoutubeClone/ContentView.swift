//
//  ContentView.swift
//  YoutubeClone
//
//  Created by 조종운 on 2021/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Main()
                .navigationBarHidden(true)
                .navigationBarTitle("")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
