//
//  SelfAppendViewDirect.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/21.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SelfAppendViewDirect: View {
    
    @EnvironmentObject var viewData: ViewData
    
    /* 뷰 활성화 비활성화 */
    @Binding var directAppend: Bool
    
    /* 식자재 정보 */
    @State var foodname: String = ""
    
    @State var foodcategory: String = ""
    
    @State var expiration: Date = Date()
    /*          */
    
    let foodTypeList: [String] = ["과일", "채소", "정육", "유제품", "해산물"]
    
    
    /* 카메라 - 이미지 */
    @State var foodImage: Image?
    
    @State var fooduiImage: UIImage?
    
    @State var imageActionSheet = false
    
    @State var showingImagePicker = false
    
    @State var usingCamera = false
    
    var cameraActionSheet: ActionSheet {
        ActionSheet(title: Text("이미지 설정"), message: Text("식자재 사진을 어떻게 추가하실건가요?"), buttons: [
            .default(Text("사진첩에서 가져오기"), action: { self.showingImagePicker = true }),
            .default(Text("직접 촬영하기"), action: { self.usingCamera = true }),
            .cancel(Text("취소"))
        ])
    }
    
    /* 누락된 정보 체크 */
    @State var errText = ""
    
    @State var errAlert = false
    
    var omissionAlert: Alert {
        Alert(title: Text("모든 정보를 입력해주세요"), message: Text(errText))
    }
    
    var body: some View {
        ZStack {
            Color(.white)
            
            ScrollView {
                VStack(spacing: 10) {
                    
                    /* 나가기 버튼 */
                    HStack {
                        Button(action: {
                            self.resetInfo()
                            withAnimation {
                                self.directAppend = false
                            }
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding()
                    
                    /* 타이틀 텍스트 */
                    HStack {
                        Text("식자재 추가")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }.padding(.leading)
                    
                    /* 식자재 이미지, 식자재 이름 */
                    HStack {
                        
                        Button(action: { self.imageActionSheet = true }) {
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 80)
                                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
                                
                                foodImage?
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)
                            }
                        }
                        .actionSheet(isPresented: $imageActionSheet, content: { cameraActionSheet })
                        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) { ImagePicker(inputImage: self.$fooduiImage) }
                        
                        Text("식자재 이름 : ")
                            .fontWeight(.semibold)
                        
                        VStack {
                            TextField("", text: $foodname)
                            Divider()
                                .padding(.trailing, 20)
                        }
                    }.padding()
                    
                    /* 식자재 타입  */
                    Direct_SelectCategory(foodcategory: $foodcategory)
                    
                    /* 유통기한 선택 */
                    DatePicker("", selection: $expiration, in: Date()..., displayedComponents: .date)
                        .labelsHidden()
                    
                    /* 식자재 추가 버튼 */
                    Button(action: {
                        self.checkInputInfo()
                    }) {
                        HStack {
                            Text("추가")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .frame(width: 300, height: 50)
                        .background(Color("foodcategory").opacity(0.7))
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                    }
                    .padding(.bottom)
                    .alert(isPresented: $errAlert, content: { omissionAlert })
                }
                .accentColor(.black)
                .padding(.vertical)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .offset(y: self.directAppend ? 0 : UIScreen.main.bounds.height)
    }
    
    func loadImage() {
        guard let fooduiImage = fooduiImage else { return }
        foodImage = Image(uiImage: fooduiImage)
    }
    
    func resetInfo() {
        self.foodname = ""
        self.foodcategory = ""
        self.expiration = Date()
        
        self.foodImage = nil
        self.fooduiImage = nil
    }
    
    func checkInputInfo() {
        if foodImage == nil {
            self.errText = "식자재 이미지를 선택해주세요"
            self.errAlert = true
            return
        }
        
        else if foodname == "" {
            self.errText = "식자재 이름을 입력해주세요"
            self.errAlert = true
            return
        }
        
        else if foodcategory == "" {
            self.errText = "식자재 종류를 선택해주세요"
            self.errAlert = true
            return
        }
        
        self.viewData.selectedFoodList.append(Selected(image: self.foodImage!, foodname: self.foodname, foodType: self.foodcategory, expiration: self.expiration))
        
        self.viewData.selectedRow = self.viewData.selectedFoodList.count / 3
        self.viewData.selectedCol = self.viewData.selectedFoodList.count % 3
        
        resetInfo()
        
        withAnimation {
            self.directAppend = false
        }
    }
}

struct SelfAppendViewDirect_Previews: PreviewProvider {
    static var previews: some View {
        SelfAppendViewDirect(directAppend: .constant(true))
    }
}
