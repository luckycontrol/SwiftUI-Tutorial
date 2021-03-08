//
//  CustomContainer.swift
//  SwiftUI_all_in_one
//
//  Created by 조종운 on 2021/02/17.
//

import SwiftUI

struct CustomContainer: View {
    var body: some View {
        GridStack(rows: 4, columns: 2) { row, col in
            HStack {
                Image(systemName: "\(row * 2 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct CustomContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainer()
    }
}
