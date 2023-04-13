//
//  DailyDescriptionView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 11.04.2023.
//

import SwiftUI

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
//        .border(.black)
    }
}

struct DailyDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        var title = "Title"
        var desc = "wdiajowi jaowijoa idwjdoaiwj doi jowijodija oiwj oaiwj odi waoi oi wdjaodiaowijaowijdoa awjo idaw"
        DailyDescriptionView(title: title, description: desc)
    }
}
