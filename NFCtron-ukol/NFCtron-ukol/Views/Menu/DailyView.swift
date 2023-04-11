//
//  DailyView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 09.04.2023.
//

import SwiftUI

struct DailyView: View {
    
//    @StateObject DailyViewViewModel
    
    var body: some View {
        ScrollView (.vertical) {
            DailyImageView()
            DailyDescriptionView(title: <#T##Binding<String>#>, description: <#T##Binding<String>#>)
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
