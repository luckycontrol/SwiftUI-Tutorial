//
//  DetailView.swift
//  CoursesAppUI_Tutorial
//
//  Created by 조종운 on 2021/02/17.
//

import SwiftUI

struct DetailView: View {
    
    let course: Course
    
    var body: some View {
        VStack {
            Text(course.name)
                .font(.title2)
                .fontWeight(.bold)
        }
        .navigationTitle(course.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {}, label: {
            Image("menu")
                .renderingMode(.template)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.gray)
        }))
    }
}
