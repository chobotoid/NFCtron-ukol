//
//  TabBarItem.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 09.04.2023.
//

import SwiftUI

struct CustomTabBarItem: View {
    
    var iconName: String
    
    var tabName: String
    
    @Binding var selectedIndex: Int
    
    var selfIndex: Int
    
    
    var body: some View {
        VStack (spacing: 1){
            Image(systemName: iconName)
                .foregroundColor(selectedIndex == selfIndex ? .white : .black)
                .padding(.horizontal, 25)
                .padding(.vertical, 5)
                .background(selectedIndex == selfIndex ? .black : .white)
                .cornerRadius(10)
            Text(tabName)
                .font(.caption2)
        }
        .onTapGesture {
            selectedIndex = selfIndex
        }
//        .border(.blue)
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        @State var idx = 0
        CustomTabBarItem(iconName: "gear", tabName: "Hello", selectedIndex: $idx, selfIndex: 0)
    }
}
