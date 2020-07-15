//
//  AppendCategoryView.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/15.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct AppendCategoryView: View {
    var body: some View {
        VStack {
            Text("")
            
            Spacer()
            HStack {
                Button(action: {}) {
                    Text("직접 추가")
                        .foregroundColor(.white)
                }
                .frame(width: 100, height: 40)
                .background(Color("foodcategory").opacity(0.8))
                .cornerRadius(15)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
                
                Spacer()
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: 300)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
        .accentColor(.black)
    }
}

struct AppendCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AppendCategoryView()
    }
}
