//
//  ContentView.swift
//  MartView
//
//  Created by 조종운 on 2020/07/01.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct FoodDetail: View {
    
    var martfood: Martfood
    
    @State var count: Int = 1
    
    @State var foodprice: String = ""
    
    var addcountButton: some View {
        Button(action: {
            self.count += 1
            self.setFoodPrice()
        }) {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("countbutton"))
                    
                Image(systemName: "plus")
                .foregroundColor(Color("buttoncolor"))
            }
        }
    }
    
    var minuscountButton: some View {
        Button(action: {
            if self.count > 1 {
                self.count -= 1
                self.setFoodPrice()
            }
        }) {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("countbutton"))
                    
                Image(systemName: "minus")
                .foregroundColor(Color("buttoncolor"))
            }
        }
    }
    
    var purchaseButton: some View {
        Button(action: {}) {
            ZStack {
                Color("buttoncolor")
                
                HStack(spacing: 20) {
                    Image(systemName: "cart.fill")
                    Text("장바구니 추가")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
            }
            .frame(width: 200, height: 70)
            .cornerRadius(15)
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 40) {
                Text(martfood.name)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                Image(martfood.name)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .modifier(FoodDetailModifier())
                
                Spacer()
                
                HStack(spacing: 40) {
                    minuscountButton
                    
                    Text("\(self.count)")
                        .fontWeight(.semibold)
                    
                    addcountButton
                }
                
                Spacer()
                
                HStack {
                    VStack(alignment: .center, spacing: 5) {
                        Text("가격")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                        
                        Text("\(foodprice) 원")
                            .fontWeight(.medium)
                    }
                    Spacer()
                    
                    purchaseButton
                }
                .padding(.horizontal, 15)
            }
            .padding(.vertical, 20)
            .onAppear {
                self.foodprice = self.martfood.price
            }
        }
        .background(Color("background").edgesIgnoringSafeArea(.all))
    }
    
    func setFoodPrice() {
        let index = martfood.price.firstIndex(of: ",")!
        var price_str = martfood.price
        price_str.remove(at: index)
        
        foodprice = String(Int(price_str)! * count)
        
        if foodprice.count == 4 {
            foodprice.insert(",", at: foodprice.index(foodprice.startIndex, offsetBy: 1))
        }
        else if foodprice.count == 5 {
            foodprice.insert(",", at: foodprice.index(foodprice.startIndex, offsetBy: 2))
        }
        else if foodprice.count == 6 {
            foodprice.insert(",", at: foodprice.index(foodprice.startIndex, offsetBy: 3))
        }
        
        /*
         100 - 3
         1,000 - 4
         10,000 - 5
         100,000 - 6
         1,000,000 - 7
         10,000,000 - 8
         100,000,000 - 9
         1,000,000,000 - 10
        */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(martfood: martfoodData[30])
    }
}
