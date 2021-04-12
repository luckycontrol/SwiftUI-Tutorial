//
//  CustomScrollView.swift
//  CustomScrollView
//
//  Created by 조종운 on 2021/04/11.
//

import SwiftUI

struct CustomScrollView<Content: View>: View {
    
    var content: Content
    
    @Binding var offset: CGPoint
    var showsIndicators: Bool
    var axis: Axis.Set
    
    init(offset: Binding<CGPoint>, showsIndicators: Bool = false, axis: Axis.Set = .vertical, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self._offset = offset
        self.showsIndicators = showsIndicators
        self.axis = axis
    }
    
    @State private var startOffset: CGPoint = .zero
    
    var body: some View {
        ScrollView(axis, showsIndicators: showsIndicators) {
            content
                .overlay(
                    GeometryReader { geometry -> Color in
                        let rect = geometry.frame(in: .global)
                        
                        if startOffset == .zero {
                            startOffset = CGPoint(x: rect.minX, y: rect.minY)
                        }
                        
                        offset = CGPoint(x: startOffset.x - rect.minX, y: startOffset.y - rect.minY)
                        
                        return Color.clear
                    }
                )
                .background(Color.black)
        }
    }
}
