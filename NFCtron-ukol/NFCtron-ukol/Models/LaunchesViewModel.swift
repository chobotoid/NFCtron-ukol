//
//  LaunchesViewModel.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 13.04.2023.
//

import Foundation

class LaunchesViewModel: ObservableObject {
    
//    @Published var
    
    @Published var pinnedLaunches: [Launch]
    
    @Published var unpinnedLaunches: [Launch]
    
    init(pinnedLaunches: [Launch], unpinnedLaunches: [Launch]) {
        self.pinnedLaunches = pinnedLaunches
        self.unpinnedLaunches = unpinnedLaunches
    }
 
    
//    func addUnpinnedLaunches(launches: [Launch]) {
//        self.unpinnedLaunches = launches
//    }
    
    func pinLaunch(launch: Launch) {
        if let index = unpinnedLaunches.firstIndex(where: {$0.uid == launch.uid}) {
            pinnedLaunches.append(launch)
            unpinnedLaunches.remove(at: index)
        }
        else {
            print("item not found in array")
        }
    }
    
    func unpinLaunch(launch: Launch) {
        if let index = pinnedLaunches.firstIndex(where: {$0.uid == launch.uid}) {
            unpinnedLaunches.append(launch)
            pinnedLaunches.remove(at: index)
        }
        else {
            print("Item not found in array")
        }
    }
    
    func unpinAllLaunches() {
        for launch in pinnedLaunches {
            unpinnedLaunches.append(launch)
        }
        pinnedLaunches.removeAll()
    }
    
    
}

//class LaunchViewItem  {
//
//    private var pinned: Bool
//
//    var youtubeLink: String
//
//    var wikiLink: String
//
//    var details: String
//
//    var date: String
//
//    init(youtubeLink: String, wikiLink: String, details: String, date: String) {
//        self.youtubeLink = youtubeLink
//        self.wikiLink = wikiLink
//        self.details = details
//        self.date = date
//        pinned = false
//    }
//
//}


