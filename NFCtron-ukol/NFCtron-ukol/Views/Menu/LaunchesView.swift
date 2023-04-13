//
//  LaunchesView.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 09.04.2023.
//

import SwiftUI

struct LaunchesView: View {
    
    @ObservedObject var vm: LaunchesViewViewModel
        
    init() {
        self.vm = LaunchesViewViewModel(status: .initial)
//        vm.getData()
    }
    
    var body: some View {
        VStack (spacing: 100) {
            VStack (spacing: 15) {
                HStack {
                    Text("Pinned")
                        .font(.title)
                    Spacer()
                    Text("Unpin all")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                VStack (spacing: 30) {
                    ForEach(vm.model.pinnedLaunches.reversed(), id: \.uid) { launch in
                        LaunchItemView(launch: launch, pinned: true)
                    }
                }
            }
            VStack (spacing: 15) {
                HStack {
                    Text("Upcoming")
                        .font(.title)
                    Spacer()
                    Text("Sort by")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                if vm.readStatus != .success {
                    ProgressView("Loading Launches")
                }
                else{
                    CustomCarouselView(launches: vm.model.unpinnedLaunches.reversed())
                }
            }
            Spacer()
        }
        .padding(.horizontal, 40)
        .background(Color("BackgroundColor"))
    }
}

struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesView()
    }
}
