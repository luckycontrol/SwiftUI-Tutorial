//
//  HeaderViewModel.swift
//  YoutubeClone
//
//  Created by 조종운 on 2021/04/24.
//

import SwiftUI

class HeaderViewModel: ObservableObject {
    @Published var nowOffset: CGFloat = 0
    
    @Published var newOffset: CGFloat = 0 {
        didSet {
            if nowOffset > newOffset {
                withAnimation(.linear(duration: 0.2)) {
                    isScrollDown = true
                }
            }
            
            if nowOffset < newOffset {
                withAnimation(.linear(duration: 0.2)) {
                    isScrollDown = false
                }
            }
            
            if nowOffset != newOffset {
                nowOffset = newOffset
            }
        }
    }
    
    @Published var isScrollDown = false
}
