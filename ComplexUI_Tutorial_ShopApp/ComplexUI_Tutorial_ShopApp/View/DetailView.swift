//
//  DetailView.swift
//  ComplexUI_Tutorial_ShopApp
//
//  Created by 조종운 on 2020/10/31.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var bagData: BagModel!
    
    @Binding var show: Bool
    
    var animation: Namespace.ID

    @State private var selectedColor = Color.red
    
    @State private var count = 1
    
    @State private var isSmallDevice = UIScreen.main.bounds.height < 750
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment:. leading, spacing: 5) {
                    Button(action: {
                        withAnimation(.easeOut) {
                            show.toggle()
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                    
                    Text("신기한 우리행성")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    Text(bagData.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.white)
                })
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Price")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(bagData.price)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                
                Image(bagData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: bagData.image, in: animation)
            }
            .padding()
            .padding(.top, 10)
            .zIndex(1)
            
            VStack {
                ScrollView(isSmallDevice ? .vertical : .init(), showsIndicators: false) {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Color")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 15) {
                                ColorButton(selectedColor: $selectedColor, color: .pink)
                                ColorButton(selectedColor: $selectedColor, color: .yellow)
                                ColorButton(selectedColor: $selectedColor, color: .blue)
                            }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Size")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Text("120,000 km")
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, isSmallDevice ? 0 : -20)
                    
                    Text("행성에 대한 설명")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            if count > 1 {
                                count -= 1
                            }
                        }) {
                            Image(systemName: "minus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        }
                        
                        Text("\(count)")
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                        Button(action: { count += 1 }, label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        })
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "suit.heart.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.red)
                                .clipShape(Circle())
                        })
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("BUY NOW")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color.purple)
                            .clipShape(Capsule())
                    }
                }
            }
            .background(Color.white.clipShape(CustomCorner()).padding(.top, isSmallDevice ? -60 : -100))
            .zIndex(0)
        }
        .background(Color.purple.ignoresSafeArea(.all, edges: .top))
        .background(Color.white.ignoresSafeArea(.all, edges: .bottom))
        .onAppear {
            selectedColor = Color.pink
        }
    }
}
