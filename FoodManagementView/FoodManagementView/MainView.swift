//
//  MainView.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/28.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewData: ViewData
    
    @State var sorting = "전체"
    
    @State var appendActionButton = false
    
    @State var selfAppendView = false
    
    let foodTypes = ["과일", "채소", "정육", "유제품", "해산물"]
    
    var appendActionSheet: ActionSheet {
        ActionSheet(title: Text("식자재를 추가하시는건가요?"), message: Text("추가하실 방법을 선택해주세요"), buttons: [
            .default(Text("QR코드를 스캔하여 추가"), action: {}),
            .default(Text("직접입력하여 추가"), action: { self.selfAppendView = true }),
            .cancel(Text("취소"))
        ])
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Text("정렬방식: \(sorting)")
                            .foregroundColor(Color.gray.opacity(0.8))
                            .fontWeight(.medium)
                    }
                    
                    /* 각 타입에 해당하는 저장된 식자재 출력 */
                    ForEach(foodTypes, id: \.self) { type in
                        PrintSavedFoodies(foodType: type)
                    }
                }
            }
            
            .navigationBarTitle("저장된 식자재")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
