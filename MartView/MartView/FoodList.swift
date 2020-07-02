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
                    .offset(x: self.menu ? -UIScreen.main.bounds.width * 2/5 : -UIScreen.main.bounds.width)
                
                if self.cart {
                    VStack {
                        MartTop(menu: self.$menu, cart: self.$cart)
                        
                        Text("카테고리")
                        Spacer()
                    }
                }
                else {
                    FoodList(menu: self.$menu, cart: self.$cart)
                        .offset(x: self.menu ? UIScreen.main.bounds.width * 3/5 : 0)
                    
                }
            }
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

struct Menu: View {
    var body: some View {
        ZStack {
            Color("category")
            
            VStack(spacing: 20) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.top, 70)
            .padding(.leading, 20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FoodList: View {
    @Binding var menu: Bool
    
    @Binding var cart: Bool
    
    var body: some View {
        VStack {
            MartTop(menu: $menu, cart: $cart)
            
            Text("list")
            Spacer()
        }
    }
}

struct FoodList_Previews: PreviewProvider {
    static var previews: some View {
        MartHome()
    }
}
