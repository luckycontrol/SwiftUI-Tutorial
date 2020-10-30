//
//  RemoveSelected.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/08/11.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct RemoveSelectedView: View {
    
    @EnvironmentObject private var viewData: ViewData
    
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                
                VStack(spacing: 15) {
                    HStack {
                        Text("식자재 삭제")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    Text("선택하신 식자재를 목록에서 삭제할까요?")
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 30) {
                        self.viewData.selectedFood?.image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                        
                        VStack {
                            if self.viewData.selectedFood != nil {
                                Text(self.viewData.selectedFood!.foodname)
                                    .fontWeight(.semibold)
                                
                                Text("\(self.viewData.selectedFood!.expiration, formatter: self.dateFormatter)")
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    
                    
                    Spacer()
                    
                    HStack {
                        /* 삭제 */
                        Button(action: {
                            withAnimation {
                                self.viewData.selectedTouched = false
                            }
                            self.viewData.selectedFoodList.remove(at: self.viewData.selectedFood!.index)
                            
                            print(self.viewData.selectedFoodList.count)
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 150, height: 50)
                                    .foregroundColor(Color("foodcategory").opacity(0.7))
                                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                
                                Text("삭제")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                        }
                        
                        Spacer()
                        
                        /* 삭제 취소 */
                        Button(action: {
                            withAnimation {
                                self.viewData.selectedTouched = false
                            }
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 150, height: 50)
                                    .foregroundColor(Color("foodcategory").opacity(0.7))
                                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                
                                Text("취소")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    
                }.padding()
            }
            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.3)
            .offset(y: self.viewData.selectedTouched ? 0 : UIScreen.main.bounds.height)
        }
        .background(viewData.selectedTouched ? Color.black.opacity(0.5) : Color.clear)
    }
}

struct RemoveSelectedView_Previews: PreviewProvider {
    
    static var previews: some View {
        RemoveSelectedView()
            .environmentObject(ViewData())
    }
}
