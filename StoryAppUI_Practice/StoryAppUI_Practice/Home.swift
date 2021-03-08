//
//  Home.swift
//  StoryAppUI_Practice
//
//  Created by 조종운 on 2021/02/18.
//

import SwiftUI

struct Home: View {
    
    @State private var index = 0
    
    @State private var stories = [
        Story(id: 0, image: "b0", offset: 0, title: "Jack the persian black catle"),
        Story(id: 1, image: "b1", offset: 1, title: "The Dreaming Moon"),
        Story(id: 2, image: "b2", offset: 2, title: "Fallen In Love"),
        Story(id: 3, image: "b3", offset: 3, title: "Hounted Ground"),
    ]
    
    @State private var scrolled = 0
    
    @State private var index1 = 0
    
    var calculatedWidth: CGFloat {
        let screen = UIScreen.main.bounds.width
        let width = screen - 110
        
        return width
    }
    
    var body: some View {
        ZStack {
            ForEach(stories) { story in
                HStack {
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                        Image(story.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: calculatedWidth, height: (UIScreen.main.bounds.height / 1.8) - CGFloat(story.id - scrolled) * 50)
                            .cornerRadius(15)
                    }
                }
            }
        }
    }
    
}

struct Story: Identifiable {
    var id: Int
    var image: String
    var offset: CGFloat
    var title: String
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
