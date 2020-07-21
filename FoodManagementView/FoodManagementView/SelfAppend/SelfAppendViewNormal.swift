//
//  SelfAppendViewNormal.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/21.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SelfAppendViewNormal: View {
    
    let food: SelectedFood
    
    @Binding var normalAppend: Bool
    
    @State var expirationDate: Date = Date()
    
    @State var location: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    Text("식자재 추가")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Image(food.foodname)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                        
                        VStack(spacing: 15) {
                            Text("식자재 이름: \(food.foodname)")
                            
                            Text("식자재 분류: \(food.foodType)")
                        }
                        .padding(.leading, 30)
                        Spacer()
                    }
                    .padding(.bottom, 60)
                    
                    Text("유통기한을 선택해주세요")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    DatePicker(selection: $expirationDate, in: Date()..., displayedComponents: .date) {
                        Text("")
                    }.labelsHidden()
                    .clipShape(Rectangle())
                    .cornerRadius(15)
                }
                
                Spacer()
                
                Button(action: {}) {
                    HStack {
                        Text("추가")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 50)
                    .background(Color("foodcategory").opacity(0.7))
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
                }
                .padding(.bottom, 15)
            }
            .padding(.horizontal)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        }
        .background(Color.white)
        .offset(y: self.normalAppend ? self.location.height : UIScreen.main.bounds.height)
        .gesture(DragGesture()
            .onChanged { value in
                if value.translation.height > 0 {
                    self.location.height = value.translation.height
                }
            }
            
            .onEnded { value in
                if self.location.height >= 200 {
                    withAnimation {
                        self.location = .zero
                        self.normalAppend = false
                    }
                } else {
                    withAnimation {
                        self.location = .zero
                    }
                }
            }
        )
    }
}

struct SelfAppendViewNormal_Previews: PreviewProvider {
    static var previews: some View {
        SelfAppendViewNormal(food: SelectedFood(foodType: "", foodname: ""), normalAppend: .constant(false))
    }
}
