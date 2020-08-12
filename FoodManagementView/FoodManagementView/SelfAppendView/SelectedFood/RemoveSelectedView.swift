//
//  RemoveSelected.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/08/11.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct RemoveSelectedView: View {
    
    @EnvironmentObject private var viewData: ViewData
    
    var body: some View {
        VStack {
            Text("Hello World!")
        }
        .clipShape(Rectangle())
        .cornerRadius(15)
        .frame(width: 300, height: 300)
        .background(Color.blue)
    }
}

struct RemoveSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveSelectedView()
    }
}
