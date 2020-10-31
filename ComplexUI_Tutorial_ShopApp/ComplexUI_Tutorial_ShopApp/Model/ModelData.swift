//
//  ModelData.swift
//  ComplexUI_Tutorial_ShopApp
//
//  Created by 조종운 on 2020/10/31.
//

import Foundation
import SwiftUI

struct BagModel: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
    var price: String
}

var bags = [
    BagModel(image: "asteroid", title: "아스트로이드", price: "100,000"),
    BagModel(image: "day-and-night", title: "낮 그리고 밤", price: "100,000"),
    BagModel(image: "jupiter", title: "목성", price: "100,000"),
    BagModel(image: "saturn", title: "세턴", price: "100,000"),
    BagModel(image: "uranus", title: "우라누스", price: "100,000")
]

var scroll_tabs = ["Hand Bag", "Jewellery", "Footwear", "Dresses", "Beauty"]
