//
//  SelfAppendViewNormal.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/21.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SelfAppendViewNormal: View {
    
    @Binding var normalAppend: Bool
    
    @EnvironmentObject var selfData: SelfAppendData
    
    @State var expirationDate: Date = Date()
    
    var body: some View {
        ZStack {
            Color(.white)
            
            VStack(spacing: 20) {
                
                HStack {
                    Button(action: {
                        withAnimation {
                            self.normalAppend = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }.padding(.vertical)
                
                HStack {
                    Text("식자재 추가")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Image(self.selfData.food.foodname)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("식자재 이름: \(self.selfData.food.foodname)")
                                .fontWeight(.semibold)
                            
                            Text("식자재 분류: \(self.selfData.food.foodType)")
                                .fontWeight(.semibold)
                        }
                        .padding(.leading, 30)
                        
                        Spacer()
                    }
                    .padding(.bottom, 60)
                    
                    Text("유통기한을 선택해주세요")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    DatePicker("", selection: $expirationDate, in: Date()..., displayedComponents: .date)
                    .labelsHidden()
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
                }.padding(.bottom)
            }
            .padding([.horizontal, .vertical])
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        }
        .edgesIgnoringSafeArea(.all)
        .offset(y: self.normalAppend ? 0 : UIScreen.main.bounds.height)
    }
}

struct SelfAppendViewNormal_Previews: PreviewProvider {
    static var previews: some View {
        SelfAppendViewNormal(normalAppend: .constant(false))
    }
}
