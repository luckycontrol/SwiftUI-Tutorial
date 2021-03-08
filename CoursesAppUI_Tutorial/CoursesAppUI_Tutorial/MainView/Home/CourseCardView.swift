//
//  CourseCardView.swift
//  CoursesAppUI_Tutorial
//
//  Created by 조종운 on 2021/02/17.
//

import SwiftUI

struct CourseCardView: View {
    
    let course: Course
    
    var body: some View {
        VStack {
            VStack {
                Image(course.asset)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 10)
                
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(course.name)
                            .font(.title3)
                        
                        Text("\(course.numCourse) Courses")
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.5), radius: 1, x: 1, y: 1)
            
            Spacer(minLength: 0)
        }
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        CourseCardView(course: Course(id: "", name: "", numCourse: 0, asset: ""))
    }
}
