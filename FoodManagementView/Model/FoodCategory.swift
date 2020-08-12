//
//  FoodCategory.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/15.
//  Copyright © 2020 조종운. All rights reserved.
//

import Foundation
import SwiftUI

struct FoodCategory: Hashable, Codable, Identifiable {
    var id: Int
    var foodType: String
    var foodname: String
}

struct SelectedFood: Hashable {
    var foodType: String
    var foodname: String
}

struct Selected {
    var index: Int
    var image: Image
    var foodname: String
    var foodType: String
    var expiration: Date
}

class ViewData: ObservableObject {
    @Published var selectedFoodList: [Selected] = []
    @Published var food: SelectedFood = SelectedFood(foodType: "", foodname: "")
    
    @Published var selectedTouched = false
    @Published var selectedRow: Int?
    @Published var selectedCol: Int?
    @Published var selectedFood: Selected?
}
