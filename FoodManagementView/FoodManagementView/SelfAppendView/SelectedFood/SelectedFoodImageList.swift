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
        GeometryReader { geo in
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 15) {
                    if self.viewData.selectedFoodList.count != 0 {
                        ForEach(0 ..< self.viewData.selectedFoodList.count, id: \.self) { index in
                            SelectedFoodImageView(selected: self.viewData.selectedFoodList[index])
                        }
                    }
//                    if self.viewData.selectedFoodList.count != 0 {
//                        ForEach(0...self.viewData.selectedRow!, id: \.self) { row in
//                            VStack {
//                                if row == self.viewData.selectedRow {
//                                    ForEach(row * 3..<row * 3 + self.viewData.selectedCol!, id: \.self) { col in
//                                        SelectedFoodImageView(selected: self.viewData.selectedFoodList[col])
//                                    }
//                                } else {
//                                    ForEach(row * 3..<row * 3 + 3, id: \.self) { col in
//                                        SelectedFoodImageView(selected: self.viewData.selectedFoodList[col])
//                                    }
//                                }
//                                Spacer()
//                            }
//                            .frame(height: geo.size.height)
//                        }
//                    }
                    Spacer()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct SelectedFoodImageList_Previews: PreviewProvider {
    
    static var previews: some View {
        SelectedFoodImageList()
            .environmentObject(ViewData())
    }
}
