//
//  TabBarItem.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 09.04.2023.
//

import SwiftUI

/// Custom TabBar like view, painful to assemble, should be working fine though
struct CustomTabBarItemView: View {
    
    let tabs: [CustomTabBarItem]
    
    @Binding var selection: CustomTabBarItem
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self ) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
    }
}

extension CustomTabBarItemView {
    private func tabView(tab: CustomTabBarItem) -> some View {
        VStack (spacing: 1){
            Image(systemName: tab.iconName)
                .foregroundColor(selection == tab ? .white : .black)
                .padding(.horizontal, 25)
                .padding(.vertical, 5)
                .background(selection == tab ? .black : .clear)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
            Text(tab.tabName)
                .font(.caption2)
        }
        .padding(.vertical, 8)
    }
    
    private func switchToTab(tab: CustomTabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
    
}

enum CustomTabBarItem: Hashable {
    case daily, launches
    
    var iconName: String {
        switch self {
        case .daily: return "photo"
        case .launches: return "calendar"
        }
    }
    
    var tabName: String {
        switch self {
        case .daily: return "Daily"
        case .launches: return "Launches"
        }
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        let tabs: [CustomTabBarItem] = [
            .daily, .launches]
        CustomTabBarItemView(tabs: tabs, selection: .constant(tabs.first!))
    }
}
