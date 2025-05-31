//
//  BackButton.swift
//  GroceryAppCoreData
//
//  Created by Sachindra Fernando on 2025-05-30.
//

import SwiftUI

struct BackButton: View {
    var action:()->()
    var color: Color
    var body: some View {
        Button {
            action()
        } label: {
            Image("ic_back")
                .foregroundColor(color)
                .frame(width: 24,height: 24)
                .padding(16)
                .frame(width: 40,height: 40)
        }

    }
}

//#Preview {
//    BackButton()
//}
