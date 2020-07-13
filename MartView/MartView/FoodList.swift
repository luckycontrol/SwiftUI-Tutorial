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
    
    @State var foodType: String = "딸기 / 블루베리"
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        NavigationView {
            ZStack {
                Menu(menu: $menu, foodType: $foodType)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                
                FoodList(menu: $menu, cart: $cart, foodType: $foodType)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.white)
                    .cornerRadius(self.menu ? 30 : 0)
                    .offset(x: self.menu ? UIScreen.main.bounds.width / 2 : self.offset.width, y: self.menu ? 15 : self.offset.height)
                    .scaleEffect(self.menu ? 0.9 : 1)
                    .rotationEffect(.init(degrees: self.menu ? -5 : 0))
                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                self.offset = gesture.translation
                                if self.offset.height < 0 || self.offset.height > 0 {
                                    self.offset.height = 0
                                }
                                if self.offset.width < 0 {
                                    self.offset.width = 0
                                }
                                print("width: \(self.offset.width)")
                                print("height: \(self.offset.height)")
                            })
                            .onEnded({ _ in
                                if self.offset.width >= 150 {
                                    withAnimation {
                                        self.offset.width = 0
                                        self.menu = true
                                    }
                                }
                            })
                    )
                
            }
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
                Image(systemName: "cart")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 25, height: 25)
            }
        }
        .padding([.top, .bottom], 15)
        .padding(.horizontal, 30)
        .background(Color.white)
    }
}

struct FoodList: View {
    @Binding var menu: Bool
    
    @Binding var cart: Bool
    
    @Binding var foodType: String
    
    var body: some View {
        VStack {
            MartTop(menu: $menu, cart: $cart)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(martfoodData, id: \.self) { food in
                    VStack {
                        if food.foodType == self.foodType {
                            NavigationLink(destination: FoodDetail(martfood: food)) {
                                VStack(alignment: .leading) {
                                    Image(food.name)
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 350, height: 350)
                                    
                                    Text("\(food.name)")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                        .padding(.top, 10)
                                        .padding(.leading, 10)
                                    
                                    Text("\(food.price) 원")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                        .padding(.bottom, 10)
                                        .padding(.leading, 10)
                                }
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: Color.gray, radius: 2, x: 1, y: 1)
                            }
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
        }
        .background(Color("background"))
    }
}

struct FoodList_Previews: PreviewProvider {
    static var previews: some View {
        MartHome()
    }
}
