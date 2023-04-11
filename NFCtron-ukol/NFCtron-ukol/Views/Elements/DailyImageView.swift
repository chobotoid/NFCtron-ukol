//
//  DailyImageView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 11.04.2023.
//

import SwiftUI

struct DailyImageView: View {
    var body: some View {
        ZStack {
            Image(systemName: "gear")
                .resizable()
                .cornerRadius(20)
                .border(.yellow)
//                        .scaledToFit()
//                .padding(40)
            VStack {
                Text("Hello there")
                Spacer()
                VStack (alignment: .leading) {
                    Text("Date")
                        .font(.caption)
//                        .border(.black)
                    Text("Today")
                        .font(.largeTitle)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .frame(height: 500)
        .padding(40)
        .border(.blue)
    }
}

struct DailyImageView_Previews: PreviewProvider {
    static var previews: some View {
        DailyImageView()
    }
}
