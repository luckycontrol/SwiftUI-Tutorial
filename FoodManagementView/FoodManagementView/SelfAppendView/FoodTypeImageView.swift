//
//  FoodTypeImageView.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/15.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct FoodTypeImageView: View {
    
    let foodType: FoodCategory
    
    @State var location: CGSize = .zero
    
    @Binding var normalAppend: Bool
    
    @EnvironmentObject var selfData: SelfAppendData
    
    var body: some View {
        VStack {
            Image(foodType.foodname)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
                .offset(x: location.width, y: location.height)
                .gesture(
                    DragGesture()
                        .onChanged { location in
                            self.location = location.translation
                            
                            if self.location.width < -386 {
                                self.location.width += 1
                            }
                            
                            print("\(self.location.height)")
                    }
                        .onEnded { _ in
                            if self.location.height > -172 || self.location.height < -414 {
                                withAnimation {
                                    self.location = .zero
                                }
                            } else {
                                self.selfData.food = SelectedFood(foodType: self.foodType.foodType, foodname: self.foodType.foodname)
                                
                                withAnimation {
                                    self.normalAppend = true
                                    self.location = .zero
                                }
                            }
                    }
            )
            
            Text(foodType.foodname)
            
            
        }
    }
}

struct FoodTypeImageView_Previews: PreviewProvider {
    static var previews: some View {
        FoodTypeImageView(foodType: foodcategory[0], normalAppend: .constant(false))
    }
}
