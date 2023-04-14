//
//  MenuBarView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 09.04.2023.
//

import SwiftUI

/// Main menu / primary view loaded when app starts
struct MenuBarView: View {
    
    @State private var tabSelection: CustomTabBarItem = .daily
    
    var body: some View {
        CustomTabBarView(selection: $tabSelection) {
            DailyView()
                .customTabItem(tab: .daily, selection: $tabSelection)
            LaunchesView()
                .customTabItem(tab: .launches, selection: $tabSelection)
        }
    }
}

struct MenuBarView_Previews: PreviewProvider {
    let tabs: [CustomTabBarItem] = [
        .daily,
        .launches]
    
    static var previews: some View {
        MenuBarView()
    }
}
