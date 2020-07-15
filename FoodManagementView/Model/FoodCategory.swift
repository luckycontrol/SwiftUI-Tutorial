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