//
//  SelectedFoodImageView.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/22.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SelectedFoodImageView: View {
    
    let selected: Selected
    
    @EnvironmentObject var viewData: ViewData
    
    @State var location: CGSize = .zero
    
    var body: some View {
        VStack {
            selected.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
                .offset(x: location.width, y: location.height)
                .gesture(DragGesture()
                    .onChanged { value in
                        self.viewData.selectedMove = true
                        self.location = value.translation
                        
                        print("width: \(self.location.width) height: \(self.location.height)")
                    }
                    .onEnded { value in
                        self.viewData.selectedMove = false
                        self.location = .zero
                    }
            )
            
            Text(selected.foodname)
        }
    }
}

struct SelectedFoodImageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedFoodImageView(selected: Selected(image: Image("사과"), foodname: "사과", foodType: "과일", expiration: Date()))
    }
}
