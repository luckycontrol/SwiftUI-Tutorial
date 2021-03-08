//
//  Home.swift
//  CoursesAppUI_Tutorial
//
//  Created by 조종운 on 2021/02/16.
//

import SwiftUI

var courses = [
    Course(name: "Coding", numCourse: 12, asset: "coding"),
    Course(name: "Trading", numCourse: 12, asset: "trading"),
    Course(name: "Cooking", numCourse: 12, asset: "cooking"),
    Course(name: "Marketing", numCourse: 12, asset: "marketing"),
    Course(name: "UI/UX", numCourse: 12, asset: "ux"),
    Course(name: "Digital Marketing", numCourse: 12, asset: "digital")
]

struct Home: View {
    
    @State private var text = ""
    @State private var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hello Carlos")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Let's upgrade your skill!")
                }
                .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {}) {
                    Image("profile")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                }
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search Courses", text: $text)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(Capsule())
                    
                    HStack {
                        Text("Categories")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Text("View All")
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.top, 25)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20) {
                        ForEach(courses) { course in
                            NavigationLink(destination: DetailView(course: course)) {
                                CourseCardView(course: course)
                            }
                        }
                    }
                    .padding(.top)
                }
                .padding()
                .padding(.bottom, edge!.bottom + 70)
            }
        }
    }
}

struct Course: Identifiable {
    var id = UUID().uuidString
    var name: String
    var numCourse: Int
    var asset: String
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
