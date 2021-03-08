//
//  CustomTabView.swift
//  CoursesAppUI_Tutorial
//
//  Created by 조종운 on 2021/02/16.
//

import SwiftUI

struct CustomTabView: View {
    
    @State private var selectedTab = "home"
    @State private var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    let tabs = ["home", "email", "folder", "settings"]
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                Home()
                    .tag("home")
                Email()
                    .tag("email")
                Folder()
                    .tag("folder")
                Settings()
                    .tag("settings")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            
            HStack {
                ForEach(tabs, id: \.self) {
                    TabButton(image: $0, selectedTab:  $selectedTab)
                    
                    if $0 != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.horizontal)
            .padding(.bottom, edge!.bottom == 0 ? 20 : 0)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}

struct TabButton: View {
    
    let image: String
    
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: { selectedTab = image }) {
            Image(image)
                .renderingMode(.original)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(selectedTab == image ? Color("tab") : Color.black.opacity(0.4))
                .padding()
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
