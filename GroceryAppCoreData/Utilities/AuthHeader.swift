//
//  AuthHeader.swift
//  GroceryAppCoreData
//
//  Created by Sachindra Fernando on 2025-05-30.
//

import SwiftUI

struct AuthHeader: View {
    
    //for back
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    
    var title:String
    var body: some View {
        HStack {
            
            BackButton(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, color: Theme.primaryColor)
            
            Spacer()
            
            Text(title)
                .font(.system(size: 18))
            
            Spacer()
            
            HStack{}
                .frame(width: 40,height: 40)
            
        }//:HStack
        .padding(.horizontal,24)
    }
}

#Preview {
    AuthHeader(title: "")
}
