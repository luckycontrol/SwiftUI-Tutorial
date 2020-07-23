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
    var foodname: String
    var foodType: String
    var expiration: Date
}

class SelfAppendData: ObservableObject {
    @Published var selectedFoodList: [SelectedFood] = []
    @Published var food: SelectedFood = SelectedFood(foodType: "", foodname: "")
}
