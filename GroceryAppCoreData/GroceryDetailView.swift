//
//  GroceryDetailView.swift
//  GroceryAppCoreData
//
//  Created by Sachindra Fernando on 2025-05-31.
//

import SwiftUI

struct GroceryDetailView: View {
    @ObservedObject var groceryItem: GroceryItem
    let storeManager: StoreManager
    @Environment(\.dismiss) var dismiss
    @State private var newName: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Edit Grocery Item")
                .font(.title)
                .bold()

            TextField("New name", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save Changes") {
                storeManager.updateGrocery(groceryItem, with: newName)
                dismiss()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)

            Spacer()
        }
        .padding()
        .onAppear {
            newName = groceryItem.itemName ?? ""
        }
    }
}

