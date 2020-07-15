//
//  SelfAppendView.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/14.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SelfAppendView: View {
    var body: some View {
        VStack {
            ForEach(foodcategory, id: \.self) { category in
                Text(category.foodname)
            }
        }
    }
}

struct SelfAppendView_Previews: PreviewProvider {
    static var previews: some View {
        SelfAppendView()
    }
}
