//
//  FoodList.swift
//  MartView
//
//  Created by 조종운 on 2020/07/01.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

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
                Image(systemName: "list.bullet")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 20, height: 20)
            }
            
            Spacer()
            
            Text("Cho Mart")
                .fontWeight(.bold)
                .font(.system(size: 18))
            
            Spacer()
            
            Button(action: {
                self.cart.toggle()
                self.menu = false
            }) {
                Image(systemName: "cart")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 20, height: 20)
            }
        }
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
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(martfoodData, id: \.self) { food in
                    VStack {
                        if food.foodType == self.foodType {
                            NavigationLink(destination: FoodDetail(martfood: food)) {
                                VStack(alignment: .leading) {
                                    Image(food.name)
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 300, height: 300)
                                    
                                    Text(food.name)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .padding(.leading, 5)
                                    
                                    Text(food.price + " 원")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                        .padding(.leading, 5)
                                        .padding(.bottom)
                                }
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(color: Color.gray, radius: 2, x: 1, y: 1)
                                .padding(.vertical, 12)
                            }
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.size.width)
            .background(Color("background"))
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct FoodList_Previews: PreviewProvider {
    static var previews: some View {
        FoodList(menu: .constant(false), cart: .constant(false), foodType: .constant("돼지고기"))
    }
}
