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
    
    @State var location: CGSize = .zero
    
    let foodTypeList: [String] = ["과일", "채소", "정육", "유제품", "해산물"]
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
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
                
                VStack(alignment: .leading) {
                    Text("식자재 종류")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(foodTypeList, id: \.self) { category in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                                        .shadow(color: .white, radius: -8, x: -3, y: -3)
                                    
                                    Button(action: {
                                        self.foodcategory = category
                                    }) {
                                        VStack {
                                            Image(self.foodcategory == category ? category + "선택" : category)
                                                .renderingMode(.original)
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                            
                                            Text(category)
                                        }
                                    }
                                }
                            }
                        }.padding([.horizontal, .vertical], 15)
                    }
                }
                
                DatePicker(selection: $expiration, in: Date()..., displayedComponents: .date) {
                    Text("")
                }.labelsHidden()
                
                
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
            }
            .accentColor(.black)
            .padding(.horizontal)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .offset(y: self.directAppend ? self.location.height : UIScreen.main.bounds.height)
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
                        self.directAppend = false
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

struct SelfAppendViewDirect_Previews: PreviewProvider {
    static var previews: some View {
        SelfAppendViewDirect(directAppend: .constant(false))
    }
}
