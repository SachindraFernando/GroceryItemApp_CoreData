//
//  GroceryAppCoreDataApp.swift
//  GroceryAppCoreData
//
//  Created by Sachindra Fernando on 2025-05-30.
//

import SwiftUI

@main
struct GroceryAppCoreDataApp: App {
    let storeManager = StoreManager.shared

    var body: some Scene {
        WindowGroup {
            ContentView(storagemanager: storeManager)
                .environment(\.managedObjectContext, storeManager.context) // 🔥 This connects the CoreData engine to SwiftUI
        }
    }
}
