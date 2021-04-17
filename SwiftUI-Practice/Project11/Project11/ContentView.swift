//
//  ContentView.swift
//  Project11
//
//  Created by 조종운 on 2021/04/17.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            return AnyView(VStack {
                Text("Size class is COMPACT")
                    .font(.largeTitle)
            })
        } else {
            return AnyView(HStack {
                Text("Size class is REGULAR")
                    .font(.largeTitle)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
