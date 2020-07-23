//
//  SelfAppendViewDirect.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/21.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SelfAppendViewDirect: View {
    
    @Binding var directAppend: Bool
    
    @State var foodname: String = ""
    
    @State var foodcategory: String = ""
    
    @State var expiration: Date = Date()
    
    let foodTypeList: [String] = ["과일", "채소", "정육", "유제품", "해산물"]
    
    var body: some View {
        ZStack {
            Color(.white)
            
            VStack(spacing: 10) {
                
                HStack {
                    Button(action: {
                        withAnimation {
                            self.directAppend = false
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
                
                HStack {
                    Text("식자재 이름 : ")
                    
                    VStack {
                        TextField("", text: $foodname)
                        Divider()
                            .padding(.trailing, 30)
                    }
                }.padding(.bottom, 20)
                
                Direct_SelectCategory(foodcategory: $foodcategory)
                
                DatePicker("", selection: $expiration, in: Date()..., displayedComponents: .date)
                    .labelsHidden()
                
                Button(action: {}) {
                    HStack {
                        Text("추가")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .frame(width: 300, height: 50)
                    .background(Color("foodcategory").opacity(0.7))
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
                }
            }
            .accentColor(.black)
            .padding([.horizontal, .vertical])
        }
        .edgesIgnoringSafeArea(.all)
        .offset(y: self.directAppend ? 0 : UIScreen.main.bounds.height)
    }
}

struct SelfAppendViewDirect_Previews: PreviewProvider {
    static var previews: some View {
        SelfAppendViewDirect(directAppend: .constant(false))
    }
}
