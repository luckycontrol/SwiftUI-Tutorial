//
//  Project11App.swift
//  Project11
//
//  Created by 조종운 on 2021/04/21.
//

import SwiftUI

@main
struct Project11App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
