//
//  DailyImageView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 11.04.2023.
//

import SwiftUI

/// View for "formatting" and loading an Image from url to be used in DailyView, doesn't seem like it when using the app, but loads one lower quality picture and then one higher quality picture (or at least it should)
struct DailyImageView: View {
    
    var title: String
    
    var date: String
    
    var imageURL: String
    
    var hdImageURL: String
    
    init(title: String, date: String, imageURL: String, hdImageURL: String) {
        self.title = title
        self.date = date
        self.imageURL = imageURL
        self.hdImageURL = hdImageURL
    }
    
    var body: some View {
        ZStack {
            image
            VStack (alignment: .leading) {
                Text(title)
                Spacer()
                VStack (alignment: .leading) {
                    Text(date)
                        .font(.caption)
                    Text("Today")
                        .font(.largeTitle)
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(25)
        }
        .frame(height: 500)
    }
    
    @ViewBuilder var image: some View {
        if imageURL == "DEFAULT" {
            Color.gray
                .cornerRadius(35)
        }
        else {
            AsyncImage(
                url: URL(string: hdImageURL),
                content: { image in
                    image.resizable()
                        .cornerRadius(35)
                },
                placeholder: {
                    AsyncImage(
                        url: URL(string: imageURL),
                        content: { image in
                            image.resizable()
                                .cornerRadius(35)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }
            )
        }
    }
    
}

struct DailyImageView_Previews: PreviewProvider {
    static var previews: some View {
        DailyImageView(title: "Title", date: "Date", imageURL: "https://apod.nasa.gov/apod/image/2304/Trottier_M31SW_APOD_Re1024.jpg", hdImageURL: "https://apod.nasa.gov/apod/image/2304/PolarisIfn_Zayaz_4000.jpg")
    }
}
