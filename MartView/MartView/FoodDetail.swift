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
    
    var foodprice: () -> String
    
    init(martfood: Martfood) {
        self.martfood = martfood
        self.foodprice = {
            let index = martfood.price.firstIndex(of: ",")!
            var str = martfood.price
            str.remove(at: index)
            return str
        }
    }
    
    var addcountButton: some View {
        Button(action: { self.count += 1 }) {
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
                    Text("구매")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
            }
            .frame(width: 200, height: 70)
            .cornerRadius(15)
        }
    }
    
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            
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
                        Text("Price")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                        
                        Text("\(martfood.price) 원")
                            .fontWeight(.medium)
                    }
                    Spacer()
                    
                    purchaseButton
                }
                .padding(.horizontal, 15)
            }
            .padding(.vertical, 20)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(martfood: martfoodData[25])
    }
}
