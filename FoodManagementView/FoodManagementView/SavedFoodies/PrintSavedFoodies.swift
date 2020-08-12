//
//  PrintSavedFoodies.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/28.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct PrintSavedFoodies: View {
    
    let foodType: String
    
    @FetchRequest(entity: SavedFoodies.entity(), sortDescriptors: []) var savedfoodies : FetchedResults<SavedFoodies>
    
    var foodieList : [SavedFoodies] = []
    
    var rowCount = 0
    
    var colCount = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(foodType)
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    Text("")
                }
            }
            
            Divider()
                .background(Color.black.opacity(0.6))
                .padding(.horizontal)
        }
        .padding(.horizontal)
        .padding(.bottom, 20)
        .onAppear {
            
        }
    }
    
    func printFoodiesHelper() {
        
    }
}

struct PrintSavedFoodies_Previews: PreviewProvider {
    static var previews: some View {
        PrintSavedFoodies(foodType: "과일")
    }
}
