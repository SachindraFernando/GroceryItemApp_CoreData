//
//  StoreManager.swift
//  GroceryAppCoreData
//
//  Created by Sachindra Fernando on 2025-05-30.
//

import Foundation
import CoreData

class StoreManager {
    static let shared = StoreManager()

    let persistentContainer: NSPersistentContainer

    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    private init() {
        persistentContainer = NSPersistentContainer(name: "GroceryCoreDataModel")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("❌ Core Data load error: \(error.localizedDescription)")
            }
        }
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }

    func saveGrocery(itemName: String) {
        guard !itemName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let groceryItem = GroceryItem(context: context)
        groceryItem.itemName = itemName

        do {
            try context.save()
            print("✅ Saved item: \(itemName)")
        } catch {
            print("❌ Save error: \(error)")
        }
    }
    
    func deleteGrocery(_ groceryItem: GroceryItem) {
        context.delete(groceryItem)
        do {
            try context.save()
            print("✅ Deleted item: \(groceryItem.itemName ?? "Unknown")")
        } catch {
            print("❌ Delete error: \(error.localizedDescription)")
        }
    }
    
    func updateGrocery(_ groceryItem: GroceryItem, with newName: String) {
        groceryItem.itemName = newName
        do {
            try context.save()
            print("✅ Updated item to: \(newName)")
        } catch {
            print("❌ Update error: \(error.localizedDescription)")
        }
    }
}
