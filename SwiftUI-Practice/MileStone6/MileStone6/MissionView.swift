//
//  MissionView.swift
//  MileStone6
//
//  Created by 조종운 on 2021/03/23.
//

import SwiftUI

struct MissionView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    Text("Description")
                        .padding()
                    
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle("Title", displayMode: .inline)
    }
}

extension Bundle {
    func decode(_ file: String) {
        
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static let missions = Bundle.main.decode("")
    
    static var previews: some View {
        MissionView()
    }
}
