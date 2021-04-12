//
//  ContentView.swift
//  CustomScrollView
//
//  Created by 조종운 on 2021/04/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var offset: CGPoint = .zero
    
    var body: some View {
        NavigationView {
            CustomScrollView(offset: $offset, content: {
                VStack(spacing: 15) {
                    ForEach(1 ... 15, id: \.self) { _ in
                        HStack(spacing: 15) {
                            Circle()
                                .fill(Color.gray.opacity(0.4))
                                .frame(width: 70, height: 70)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.4))
                                    .frame(height: 15)
                                
                                Rectangle()
                                    .fill(Color.gray.opacity(0.4))
                                    .frame(height: 15)
                                    .padding(.trailing, 90)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            })
            .navigationTitle("\(offset.y, specifier: "%.2f")")
        }
    }
}

extension Button where Label == Image {
    init(iconName: String, action: @escaping () -> Void) {
        self.init(action: action) {
            Image(systemName: iconName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
