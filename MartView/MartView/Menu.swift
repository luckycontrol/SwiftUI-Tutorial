//
//  Menu.swift
//  MartView
//
//  Created by 조종운 on 2020/07/10.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct Menu: View {
    
    @State var index = 1
    
    @State var catalogue = true
    
    var body: some View {
        HStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                    
                    Text("안녕하세요")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    Text("조 종운님")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        withAnimation {
                            self.index = 1
                            self.catalogue.toggle()
                        }
                    }) {
                        HStack {
                            Text("카테고리")
                                .foregroundColor(self.index == 1 ? Color("menucolor") : Color.white)
                                .fontWeight(self.index == 1 ? .bold : .none)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color("menucolor").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    if self.catalogue {
                        Catalogue()
                        
                    }
                    
                    Button(action: {
                        withAnimation {
                            self.index = 2
                            self.catalogue = false
                        }
                    }) {
                        HStack {
                            Text("장바구니")
                                .foregroundColor(self.index == 2 ? Color("menucolor") : Color.white)
                                .fontWeight(self.index == 2 ? .bold : .none)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color("menucolor").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Divider()
                        .frame(width: 150, height: 2)
                        .background(Color.white)
                        .padding(.vertical, 25)
                    
                    // 로그인 버튼
                    
                    Spacer(minLength: 0)
                }
                .padding(.horizontal)
                .padding(.top, 25)
            }
            Spacer(minLength: 0)
        }
    }
}

struct Catalogue: View {
    
    @State var index = 1
    
    @State var fruit = true
    
    @State var vegetable = false
    
    @State var meat = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button(action: {
                self.index = 1
                withAnimation {
                    self.fruit.toggle()
                    self.vegetable = false
                    self.meat = false
                }
            }) {
                HStack {
                    Text("과일")
                        .foregroundColor(self.index == 1 ? Color("menucolor") : Color.white)
                        .fontWeight(self.index == 1 ? .bold : .none)
                }
            }
            
            if fruit {
                VStack(alignment: .leading, spacing: 15) {
                    Button(action: {}) {
                        Text("사과")
                    }
                    
                    Button(action: {}) {
                        Text("딸기 / 블루베리")
                    }
                    
                    Button(action: {}) {
                        Text("감귤 / 한라봉")
                    }
                }
                .padding(.vertical, 5)
                .padding(.leading, 10)
            }
            
            Button(action: {
                self.index = 2
                withAnimation {
                    self.vegetable.toggle()
                    self.fruit = false
                    self.meat = false
                }
            }) {
                HStack {
                    Text("채소")
                        .foregroundColor(self.index == 2 ? Color("menucolor") : Color.white)
                        .fontWeight(self.index == 2 ? .bold : .none)
                }
            }
            
            if vegetable {
                VStack(alignment: .leading, spacing: 15) {
                    Button(action: {}) {
                        Text("고구마 / 감자")
                    }
                    
                    Button(action: {}) {
                        Text("상추 / 깻잎")
                    }
                    
                    Button(action: {}) {
                        Text("시금치 / 부추")
                    }
                }
                .padding(.vertical, 5)
                .padding(.leading, 10)
            }
            
            Button(action: {
                self.index = 3
                withAnimation {
                    self.meat.toggle()
                    self.fruit = false
                    self.vegetable = false
                }
            }) {
                HStack {
                    Text("정육")
                        .foregroundColor(self.index == 3 ? Color("menucolor") : Color.white)
                        .fontWeight(self.index == 3 ? .bold : .none)
                }
            }
            
            if meat {
                VStack(alignment: .leading, spacing: 15) {
                    Button(action: {}) {
                        Text("소고기")
                    }

                    Button(action: {}) {
                        Text("돼지고기")
                    }

                    Button(action: {}) {
                        Text("닭 / 오리고기")
                    }
                }
                .padding(.vertical, 5)
                .padding(.leading, 10)
            }
        }
        .padding(.vertical, 10)
        .padding(.leading, 10)
        .foregroundColor(.white)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
