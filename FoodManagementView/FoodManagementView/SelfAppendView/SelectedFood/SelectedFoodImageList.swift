//
//  SelectedFoodImageList.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/22.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SelectedFoodImageList: View {
    
    @EnvironmentObject var viewData: ViewData
    
    var body: some View {
        VStack {
            if self.viewData.selectedFoodList.count != 0 {
                ForEach(0...self.viewData.selectedRow!, id: \.self) { row in
                    HStack {
                        if row == self.viewData.selectedRow {
                            ForEach(row * 5..<row * 5 + self.viewData.selectedCol!, id: \.self) { col in
                                SelectedFoodImageView(selected: self.viewData.selectedFoodList[col])
                            }
                        } else {
                            ForEach(row * 5..<row * 5 + 5, id: \.self) { col in
                                SelectedFoodImageView(selected: self.viewData.selectedFoodList[col])
                            }
                        }
                    }
                }
            }
        }.padding()
    }
}

struct SelectedFoodImageList_Previews: PreviewProvider {
    static var previews: some View {
        SelectedFoodImageList()
    }
}
