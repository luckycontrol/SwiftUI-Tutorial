//
//  Bottom.swift
//  YoutubeClone
//
//  Created by 조종운 on 2021/04/26.
//

import SwiftUI

struct Bottom: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            HStack(spacing: 50) {
                Button(action: {}) {
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                Button(action: {}) {
                    Image(systemName: "safari")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                Button(action: {}) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
                
                Button(action: {}) {
                    Image(systemName: "play.rectangle")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                Button(action: {}) {
                    Image(systemName: "rectangle.stack")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.white.edgesIgnoringSafeArea(.bottom))
            .overlay(
                Divider()
                , alignment: .top
            )
        }
    }
}

struct Bottom_Previews: PreviewProvider {
    static var previews: some View {
        Bottom()
    }
}
