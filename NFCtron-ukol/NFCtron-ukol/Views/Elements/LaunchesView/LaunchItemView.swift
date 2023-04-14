//
//  LaunchView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 13.04.2023.
//

import SwiftUI

/// View containing info about one Launch
struct LaunchItemView: View {
    
    var pinned: Bool
    
    var launch: Launch
    
    init(launch: Launch, pinned: Bool) {
        self.pinned = pinned
        self.launch = launch
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                HStack {
                    Image(systemName: "gear")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .cornerRadius(45)
                    VStack (alignment: .leading) {
                        Text(launch.name ?? "")
                            .font(.title2)
                        TimeCountdownView(dateString: launch.date_utc ?? "")
                    }
                }
                HStack (spacing: 20) {
                    LivestreamButtonView(url: launch.links?.webcast ?? "")
                    WikiButtonView(url: launch.links?.wikipedia ?? "")
                }
            }
            Spacer()
            Image(systemName: "paperclip")
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(-45))
                .frame(height: 30)
                .padding(25)
                .foregroundColor(pinned ? .white : .black)
                .background(pinned ? .orange : Color("PinnedIconBackgroundColor"))
                .cornerRadius(15)
                .onTapGesture {
                    
                }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        let launch: Launch = Launch(links: CustomLinks(), static_fire_date_utc: "", name: "dsa", details: "zxc")
        LaunchItemView(launch: launch, pinned: false)
    }
}
