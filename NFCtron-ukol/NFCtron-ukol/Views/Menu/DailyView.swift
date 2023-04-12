//
//  DailyView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 09.04.2023.
//

import SwiftUI

struct DailyView: View {
        
    @ObservedObject var vm: DailyViewViewModel
        
    @State var title: String
    
    @State var description: String
    
    init() {
        self.title = "Title"
        self.description = "Description"
        vm = DailyViewViewModel()
    }
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            DailyImageView(title: vm.model.title ?? "Title not loaded", date: vm.model.date ?? "Date not loaded", imageURL: vm.model.imageURL ?? "DEFAULT", hdImageURL: vm.model.hdImageURL ?? "DEFAULT")
            DailyDescriptionView(title: "Explanation", description: vm.model.description ?? "Explanation not loaded")
        }
        .padding(.horizontal, 40)
        .background(Color("BackgroundColor"))
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
