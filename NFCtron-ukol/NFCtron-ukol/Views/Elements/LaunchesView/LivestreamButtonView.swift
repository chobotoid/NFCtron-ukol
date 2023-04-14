//
//  LivestreamButtonView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 13.04.2023.
//

import SwiftUI

/// View containing the livestream button
struct LivestreamButtonView: View {
    
    var url: URL?
    
    init(url: String) {
        self.url = URL(string: url)
    }
    
    var body: some View {
        if let correctURL = url {
            Link(destination: correctURL) {
                HStack (spacing: 15) {
                    Image(systemName: "play.fill")
                    Text("Livestream")
                }
            }
            .foregroundColor(.white)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(.pink)
            .cornerRadius(5)
            .onTapGesture {
            }
        }
    }
}

struct LivestreamButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LivestreamButtonView(url: "blabla")
    }
}
