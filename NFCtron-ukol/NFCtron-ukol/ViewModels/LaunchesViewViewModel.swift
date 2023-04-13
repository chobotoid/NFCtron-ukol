//
//  LaunchesViewViewModel.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 13.04.2023.
//

import SwiftUI

class LaunchesViewViewModel: ObservableObject {
    
    @State var model: LaunchesViewModel
    
    @Published var readStatus: DataReadStatus
    
    init(status: DataReadStatus) {
        model = LaunchesViewModel(pinnedLaunches: [], unpinnedLaunches: [])
        self.readStatus = status
        getData()
    }
    
    func getData() {
//        print("Starting")
        readStatus = .started
        let tmpUrl = URL(string: "https://api.spacexdata.com/v4/launches")
        guard let url = tmpUrl else{
            print("URL FAILED")
            return
        }
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            else if let data = data {
                let postResponse: [Launch]
                do {
//                    print("BEFORE DECODING")
                    postResponse = try JSONDecoder().decode([Launch].self, from: data)
//                    print("AFTER DECODING")
//                    print(postResponse)
                    self.saveDataToModel(response: postResponse)
                }
                catch {
                    print(error)
                }
            }
            else{
//                print("ELSE")
            }
        }
        task.resume()
//        print("ENDING")
    }
    
    
    func saveDataToModel(response: [Launch]) {
        model.unpinnedLaunches = response
        readStatus = .success
    }
    
}
