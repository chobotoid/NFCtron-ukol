//
//  DailyDescriptionView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 11.04.2023.
//

import SwiftUI

/// View containing description for the DailyView
struct DailyDescriptionView: View {
    
    var title: String
    var description: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text(title)
                .font(.largeTitle)
            Text(description)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct DailyDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        let title = "Title"
        let desc = "wdiajowi jaowijoa idwjdoaiwj doi jowijodija oiwj oaiwj odi waoi oi wdjaodiaowijaowijdoa awjo idaw"
        DailyDescriptionView(title: title, description: desc)
    }
}
