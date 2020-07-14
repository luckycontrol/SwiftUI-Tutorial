//
//  MartHome.swift
//  MartView
//
//  Created by 조종운 on 2020/07/14.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct MartHome: View {
    
    @State var menu: Bool = false
    
    @State var cart: Bool = false
    
    @State var foodType: String = "딸기 / 블루베리"
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        NavigationView {
            ZStack {
                Menu(menu: $menu, foodType: $foodType)
                
                FoodList(menu: $menu, cart: $cart, foodType: $foodType)
                    .cornerRadius(self.menu ? 30 : 0)
                    .offset(x: self.menu ? UIScreen.main.bounds.width / 2 : self.offset.width, y: self.menu ? 15 : 0)
                    .scaleEffect(self.menu ? 0.9 : 1)
                    .rotationEffect(.init(degrees: self.menu ? -5 : 0))
                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                self.offset = gesture.translation

                                if self.menu == false && self.offset.width < 0 {
                                    self.offset.width = 0
                                }

                                if self.menu == true && self.offset.width < 0 {
                                    withAnimation {
                                        self.offset.width = 0
                                        self.menu = false
                                    }
                                }
                                print("width: \(self.offset.width)")
                            })
                            .onEnded({ _ in
                                if self.offset.width >= 150 {
                                    withAnimation {
                                        self.offset.width = 0
                                        self.menu = true
                                    }
                                } else {
                                    withAnimation {
                                        self.offset.width = 0
                                    }
                                }
                            })
                    )
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    
    }
}

struct MartHome_Previews: PreviewProvider {
    static var previews: some View {
        MartHome()
    }
}
