//
//  CustomTabBar.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 11.04.2023.
//

import SwiftUI

/// Custom TabView like view, pretty complex, had help from youtube, should work as far as I know
struct CustomTabBarView<Content:View>: View {
    
    @Binding var selection: CustomTabBarItem
    
    let content: Content
    
    @State private var tabs: [CustomTabBarItem] = []
    
    init(selection: Binding<CustomTabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack (spacing: 0) {
            ZStack {
                content
            }
            CustomTabBarItemView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(CustomTabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        let tabs: [CustomTabBarItem] = [.daily, .launches]
        
        CustomTabBarView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
