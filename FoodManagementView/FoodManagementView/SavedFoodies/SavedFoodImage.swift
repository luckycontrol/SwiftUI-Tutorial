//
//  SavedFoodImage.swift
//  FoodManagementView
//
//  Created by 조종운 on 2020/07/29.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct SavedFoodImage: View {
    
    let food: Selected
    
    let expiration = Calendar.current.date(byAdding: .day, value: 10, to: Date())!
    
    let dateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    let expirationBackground = ["fresh", "alert", "becareful", "trash"]
    
    @State var expirationStatus = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 110, height: 180)
                .foregroundColor(Color(expirationStatus))
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
            
            Image(food.foodname)
                .resizable()
                .frame(width: 90, height: 90)
                .clipShape(Circle())
                .shadow(color: Color(expirationStatus), radius: 8, x: 2, y: 2)
                .offset(x: 45, y: -30)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("\(food.foodname)")
                    .fontWeight(.bold)
                Text("\(expiration, formatter: dateformatter)")
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
            .offset(x: -3, y: 40)
        }
        .onAppear {
            self.getExpirationColor()
        }
    }
    
    func getExpirationColor() {
        var components = DateComponents()
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        let today = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: Date()))!
        
        let stillFresh = Calendar.current.date(byAdding: .day, value: 7, to: today)!
        let youNeedAlert = Calendar.current.date(byAdding: .day, value: 3, to: today)!
        let thatIsTrash = today


//        유통기한이 오늘보다 작은 경우 - 유통기한 지남
//        유통기한이 오늘보다 3이하 큰 경우 - 유통기한 위험
//        유통기한이 오늘보다 7일 이하 큰 경우 - 유통기한 경고
//        그외 안전
        if expiration < thatIsTrash {
            self.expirationStatus = "trash"
        }
        if expiration > thatIsTrash {
            self.expirationStatus = "becareful"
        }
        if expiration > youNeedAlert {
            self.expirationStatus = "alert"
        }
        if expiration > stillFresh {
            self.expirationStatus = "fresh"
        }
        
        print(stillFresh)
        print(expiration)
        
    }
}

struct SavedFoodImage_Previews: PreviewProvider {
    
    static var previews: some View {
        SavedFoodImage(food: Selected(index: 0, image: Image("사과"), foodname: "사과", foodType: "과일", expiration: Date()))
    }
}
