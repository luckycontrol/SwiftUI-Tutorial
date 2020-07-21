//
//  ContentView.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/14.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct FoodManagement: View {
    var body: some View {
        NavigationView {
            ZStack {
                FoodManagementMenu()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodManagement()
    }
}
