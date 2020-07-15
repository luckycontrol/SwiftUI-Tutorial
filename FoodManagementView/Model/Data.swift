//
//  Data.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/15.
//  Copyright © 2020 조종운. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

let foodcategory: [FoodCategory] = load("SelfAppendDataSet.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("파일 \(filename)을 찾을 수 없습니다.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("파일 \(filename)을 불러올 수 없습니다.")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("파일 \(filename)을 \(T.self)로 변환할 수 없습니다. \n error: \(error)")
    }
}


