//
//  ListPractice.swift
//  MileStone3
//
//  Created by 조종운 on 2021/03/10.
//

import SwiftUI

struct ListPractice: View {
    var body: some View {
        VStack {
            HStack {
                Text("팔로잉")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            List {
                Section(header: Text("Section 1")) {
                    Text("Row 1")
                    Text("Row 2")
                }
                
                Section(header: Text("Section 2")) {
                    Text("Row 1")
                    Text("Row 2")
                }
                
                Section(header: Text("Section 3")) {
                    Text("Row 1")
                    Text("Row 2")
                }
            }
        }
        .padding()
        
        //        List(0 ..< 5) {
        //            Text("Row \($0)")
        //        }
    }
}

struct ListPractice_Previews: PreviewProvider {
    static var previews: some View {
        ListPractice()
    }
}
