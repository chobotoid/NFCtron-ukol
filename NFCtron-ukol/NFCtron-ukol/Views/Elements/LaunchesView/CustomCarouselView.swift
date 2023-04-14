//
//  CustomCarouselView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 13.04.2023.
//

import SwiftUI

/// View containing carousel view for the LaunchesVIew, painful to create as much as to look at, however should be working
struct CustomCarouselView: View {
    
    var launches: [Launch]
    
    var body: some View {
        content
    }
    
    @ViewBuilder var content: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach(launches, id: \.uid) { launch in
                    VStack{
                        LaunchItemView(launch: launch, pinned: false)
                        if let currIndex = launches.firstIndex(where: {$0.uid == launch.uid}){
                            
                            if currIndex + 1 < launches.endIndex {
                                LaunchItemView(launch: launches[currIndex + 1], pinned: false)
                            }
                        }
                    }
                }
            }
        }
    }
}


struct CustomCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        let launches: [Launch] = []
        CustomCarouselView(launches: launches)
    }
}
