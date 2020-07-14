//
//  Test.swift
//  MartView
//
//  Created by 조종운 on 2020/07/14.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct Test: View {
    
    @State var foodType: String = "돼지고기"
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(martfoodData, id: \.self) { food in
                    VStack {
                        if food.foodType == self.foodType {
                            Text(food.name)
                        }
                    }
                }
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
