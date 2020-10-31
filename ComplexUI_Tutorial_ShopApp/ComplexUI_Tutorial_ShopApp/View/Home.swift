//
//  Home.swift
//  ComplexUI_Tutorial_ShopApp
//
//  Created by 조종운 on 2020/10/30.
//

import SwiftUI

struct Home: View {
    
    @State private var selectedTab = scroll_tabs[0]
    
    @Namespace var animation
    
    @State private var show = false
    
    @State private var selectedBag: BagModel!
    
    var body: some View {
        ZStack {
            VStack {
                // MARK: Top
                ZStack {
                    HStack(spacing: 15) {
                        Button(action: {}, label: {
                            Image(systemName: "line.horizontal.3.decrease")
                                .font(.title)
                                .foregroundColor(.black)
                        })
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}, label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundColor(.black)
                        })
                        
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                            Button(action: {}, label: {
                                Image(systemName: "cart")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                            })
                            
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: 15, height: 15)
                                .offset(x: 5, y: -10)
                        })
                    }
                    
                    Text("Shop")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false) {
                    // MARK: Category
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack {
                            HStack {
                                Text("행성")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                HStack(spacing: 15) {
                                    ForEach(scroll_tabs, id: \.self) { tab in
                                        TabButton(selectedTab: $selectedTab, title: tab, animation: animation)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.top, 10)
                            })
                        }
                    })
                    
                    // MARK: Grid
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 15) {
                        ForEach(bags) { bag in
                            BagView(bagData: bag, animation: animation)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedBag = bag
                                        show.toggle()
                                    }
                                }
                        }
                    }
                    .padding()
                    .padding(.top, 10)
                }
            }
            .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
            
            if selectedBag != nil && show {
                DetailView(bagData: $selectedBag, show: $show, animation: animation)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
