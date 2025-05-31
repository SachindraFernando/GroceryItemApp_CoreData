//
//  CustomButtons.swift
//  GroceryAppCoreData
//
//  Created by Sachindra Fernando on 2025-05-30.
//

import SwiftUI

//Btn Style
struct PrimaryBtnStyle: ViewModifier {
    
    var foregroundColor: Color = Color.white
    var colorBackground: Color = Theme.primaryColor
    var minWith:CGFloat = 60
    var maxWidth:CGFloat = .infinity
    var minHeight:CGFloat = 50
    var maxHeight:CGFloat = 55
    var cornerRadius:CGFloat = 30

    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .foregroundColor(foregroundColor)
            .frame(minWidth: minWith, maxWidth: maxWidth, minHeight: minHeight, maxHeight: maxHeight, alignment: .center)
            .background(colorBackground)
            .cornerRadius(cornerRadius)
            .shadow(color: Color.black.opacity(0.06), radius: 20, x: 0.0, y: 8.0)
    }
}
