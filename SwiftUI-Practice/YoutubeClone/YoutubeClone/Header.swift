//
//  Header.swift
//  YoutubeClone
//
//  Created by 조종운 on 2021/04/24.
//

import SwiftUI

struct Header: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showingActionSheet = false
    
    @State private var color: Color = .white
    
    var body: some View {
        HStack(spacing: 20) {
            HStack(spacing: 8) {
                Image("youtube")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("YouTube")
                    .fontWeight(.bold)
                    .kerning(0.5)
                    .offset(x: -10)
            }
            
            Spacer(minLength: 0)
            
            Button(action: {}) {
                Image(systemName: "display")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            Button(action: {}) {
                Image(systemName: "bell")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            NavigationLink(destination: Text("Search")) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            Button(action: {
                showingActionSheet.toggle()
            }) {
                Circle()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal)
        .background(color.edgesIgnoringSafeArea(.top))
        .overlay(
            Divider()
            , alignment: .bottom
        )
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(
                title: Text("Change background"),
                message: Text("Select a color"),
                buttons: [
                    .default(Text("Red")) { withAnimation{ color = .blue } },
                    .default(Text("Green")) { color = .green },
                    .default(Text("Blue")) { color = .pink },
                    .destructive(Text("cancel")) 
                ]
            )
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
