//
//  Martfood.swift
//  MartView
//
//  Created by 조종운 on 2020/07/01.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct Martfood: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var category: String
    var foodType: String
    var price: String
}

