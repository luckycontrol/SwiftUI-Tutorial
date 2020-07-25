//
//  AppendCategoryView.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/15.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct AppendCategoryView: View {
    
    @Binding var directAppend: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                SelectedFoodImageList()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
                            self.directAppend = true
                        }
                    }) {
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
        }
        .frame(height: 250)
        .background(Color.gray.opacity(0.15))
        .cornerRadius(15)
        .accentColor(.black)
    }
}

struct AppendCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AppendCategoryView(directAppend: .constant(false))
    }
}
