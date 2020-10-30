//
//  BundlePractice.swift
//  NavigationBarPractice
//
//  Created by 조종운 on 2020/09/11.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI


struct BundlePractice: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    
    guard let fileURL = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("")
    }
    
    guard let data = try? Data(contentsOf: fileURL) else {
        fatalError("")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("")
    }
}


struct MartFood: Identifiable, Hashable, Codable {
    var id: Int
    var name: String
    var category: String
    var foodType: String
    var price: String
}

struct BundlePractice_Previews: PreviewProvider {
    static var previews: some View {
        BundlePractice()
    }
}
