//
//  WikiButtonView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 13.04.2023.
//

import SwiftUI

/// View containing the Wiki button
struct WikiButtonView: View {
    
    var url: URL?
    
    init(url: String) {
        self.url = URL(string: url)
    }
    
    @ViewBuilder var body: some View {
        if let correctURL = url {
            Link(destination: correctURL) {
                HStack {
                    Image(systemName: "link")
                        .resizable()
                        .rotationEffect(.degrees(45))
                        .scaledToFit()
                        .frame(height: 15)
                    Text("Wiki")
                        .fontWeight(.bold)
                }
            }
            .foregroundColor(.black)
        }
    }
}

struct WikiButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WikiButtonView(url: "blabla")
    }
}
