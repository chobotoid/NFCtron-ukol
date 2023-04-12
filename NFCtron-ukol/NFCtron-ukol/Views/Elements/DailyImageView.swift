//
//  DailyImageView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 11.04.2023.
//

import SwiftUI

struct DailyImageView: View {
    
    var title: String
    
    var date: String
    
    var imageURL: String
    
    var hdImageURL: String
//    @ObservedObject var
    
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
//                        .border(.black)
                    Text("Today")
                        .font(.largeTitle)
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(25)
        }
        .frame(height: 500)
//        .padding(40)
//        .border(.blue)
    }
    
    @ViewBuilder var image: some View {
        if imageURL == "DEFAULT" {
            Color.gray
//                .resizable()
//                .foregroundColor(.white)
//                .background(.black)
                .cornerRadius(35)
//                .border(.yellow)
        }
        else {
            AsyncImage(
                url: URL(string: hdImageURL),
                content: { image in
                    image.resizable()
                        .cornerRadius(35)
                },
                placeholder: {
//                    ZStack{
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
//                        Text("Hello There")
//                            .foregroundColor(.white)
//                            .font(.largeTitle)
//                    }
                }
            )
//            AsyncImage(url: URL(string: imageURL), scale: 0.02, transaction: Transaction(animation: .default)) { image in
//                image.image?.resizable()
//                    .cornerRadius(35)
//            }
        }
    }
    
}

struct DailyImageView_Previews: PreviewProvider {
    static var previews: some View {
        DailyImageView(title: "Title", date: "Date", imageURL: "https://apod.nasa.gov/apod/image/2304/Trottier_M31SW_APOD_Re1024.jpg", hdImageURL: "https://apod.nasa.gov/apod/image/2304/PolarisIfn_Zayaz_4000.jpg")
    }
}
