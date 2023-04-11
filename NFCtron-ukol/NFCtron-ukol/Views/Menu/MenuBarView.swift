//
//  MenuBarView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 09.04.2023.
//

import SwiftUI

struct MenuBarView: View {
    
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedIndex) {
                    DailyView()
                        .tag(0)
                    LaunchesView()
                        .tag(1)
                }
            }
//            .border(.green)
            
            VStack {
                Spacer()
                CustomTabBar(selectedIndex: $selectedIndex)
            }
//            .border(.yellow)
        }
    }
}

struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView()
    }
}
//
