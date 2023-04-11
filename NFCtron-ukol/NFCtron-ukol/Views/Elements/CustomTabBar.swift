//
//  CustomTabBar.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 11.04.2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            Spacer()
            CustomTabBarItem(iconName: "photo", tabName: "Daily", selectedIndex: $selectedIndex, selfIndex: 0)
//                .onTapGesture {
//                    selectedIndex = 0
//                }
            Spacer()
            CustomTabBarItem(iconName: "calendar", tabName: "Launches", selectedIndex: $selectedIndex, selfIndex: 1)
//                .onTapGesture {
//                    print("CLICKED")
//                    selectedIndex = 1
//                }
            Spacer()
        }
        .onChange(of: selectedIndex) { newValue in
            print(selectedIndex)
        }
//        .animation(.easeIn, value: )
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        @State var idx: Int = 0
        CustomTabBar(selectedIndex: $idx)
    }
}
