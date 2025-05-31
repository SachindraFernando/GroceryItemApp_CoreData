//
//  ContentView.swift
//  GroceryAppCoreData
//
//  Created by Sachindra Fernando on 2025-05-30.
//

import SwiftUI

struct ContentView: View {
    let storagemanager: StoreManager
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(
        entity: GroceryItem.entity(),
        sortDescriptors: []
    ) var groceryList: FetchedResults<GroceryItem>

    @State private var groceryItemName: String = ""

    var body: some View {
        VStack(spacing: 24) {
            Text("🛒 Grocery List of Shame")
                .foregroundColor(Theme.primaryColor)
                .font(.title)
                .bold() 
                .font(.system(size: 18))

            TextField("Enter Item", text: $groceryItemName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Save Grocery Item") {
                storagemanager.saveGrocery(itemName: groceryItemName)
                groceryItemName = ""
            }
            .modifier(PrimaryBtnStyle(maxWidth: .infinity, minHeight: 56))
            .padding(.top, 32)

            if groceryList.isEmpty {
                Text("No items found 🥲")
                    .foregroundColor(.gray)
            } else {
                List {
                    ForEach(groceryList, id: \.self) { item in
                        Text(item.itemName ?? "")
                    }
                    .onDelete(perform: deleteItems)
                }
            }

            Spacer()
        }
        .padding()
    }
    func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            let item = groceryList[index]
            storagemanager.deleteGrocery(item)
        }
    }

}
