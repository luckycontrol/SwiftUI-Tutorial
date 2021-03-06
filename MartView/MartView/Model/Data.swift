//
//  Data.swift
//  MartView
//
//  Created by 조종운 on 2020/07/01.
//  Copyright © 2020 조종운. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

let martfoodData: [Martfood] = load("RefrigerData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("\(filename)을 찾을 수 없습니다.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("\(filename)을 불러올 수 없습니다. 에러명:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("\(filename)을 \(T.self)로 파싱할 수 없습니다. 에러명: \n\(error)")
    }
}
