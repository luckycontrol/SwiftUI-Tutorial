//
//  ContentView.swift
//  LocalNotificationPractice
//
//  Created by 조종운 on 2020/10/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("알람 버튼") {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("Auth granted")
                } else if let error = error { }
            }
            
            let content = UNMutableNotificationContent()
            content.title = "알람 타이틀"
            content.subtitle = "알람 서브"
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 8
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
//            UNUserNotificationCenter.current().add(request)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
