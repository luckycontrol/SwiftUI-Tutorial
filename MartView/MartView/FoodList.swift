//
//  FoodList.swift
//  MartView
//
//  Created by 조종운 on 2020/07/01.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct MartHome: View {
    
    @State var menu: Bool = false
    
    @State var cart: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Menu()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                
                FoodList(menu: $menu, cart: $cart)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.white)
                    .cornerRadius(self.menu ? 30 : 0)
                    .offset(x: self.menu ? UIScreen.main.bounds.width / 2 : 0, y: self.menu ? 15 : 0)
                    .scaleEffect(self.menu ? 0.9 : 1)
                    .rotationEffect(.init(degrees: self.menu ? -5 : 0))
                
            }
            .background(Color("category").edgesIgnoringSafeArea(.all))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct MartTop: View {
    
    @Binding var menu: Bool
    
    @Binding var cart: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    self.menu.toggle()
                    self.cart = false
                }
            }) {
                Image(systemName: "list.bullet.indent")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 25, height: 20)
            }
            
            Spacer()
            
            Text("Cho Mart")
                .fontWeight(.bold)
                .font(.system(size: 22))
            
            Spacer()
            
            Button(action: {
                self.cart.toggle()
                self.menu = false
            }) {
                Image(systemName: "cart.fill")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 25, height: 25)
            }
        }
        .padding(.top, 15)
        .padding(.horizontal, 30)
    }
}

struct FoodList: View {
    @Binding var menu: Bool
    
    @Binding var cart: Bool
    
    var body: some View {
        VStack {
            MartTop(menu: $menu, cart: $cart)
            
            Text("list")
            Spacer(minLength: 0)
        }
    }
}

struct FoodList_Previews: PreviewProvider {
    static var previews: some View {
        MartHome()
    }
}
