//
//  Lobby.swift
//  MileStone4
//
//  Created by 조종운 on 2021/03/17.
//

import SwiftUI

struct Lobby: View {
    
    let menus = ["게임방법", "개인점수", "랭킹"]
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                VStack(alignment: .leading) {
                    Text("안녕하세요.")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("종운님")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "person.circle")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color.black.opacity(0.8))
                        .frame(width: 60, height: 60)
                }
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20) {
                ForEach(menus, id: \.self) { menu in
                    NavigationLink(destination: MenuDetail(title: menu)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("\(menu)"))
                            
                            VStack {
                                HStack {
                                    Text("\(menu)")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                }
                                .padding()
                                
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: 150)
                    }
                }
            }
            
            Spacer()
            
            NavigationLink(destination: GameReady()) {
                Text("게임시작")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .background(Color.pink)
                    .clipShape(Capsule())
            }
        }
        .padding()
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

extension View {
    func linkStyle(color: String) -> some View {
        modifier(LinkStyle(color: color))
    }
}

struct LinkStyle: ViewModifier {
    let color: String
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(minWidth: 80, maxHeight: 80)
            .background(Color("\(color)"))
    }
}
