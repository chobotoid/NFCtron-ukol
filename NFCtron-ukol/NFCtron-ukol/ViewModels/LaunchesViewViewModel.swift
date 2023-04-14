//
//  LaunchesViewViewModel.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 13.04.2023.
//

import SwiftUI

/// ViewModel for the LaunchesView
class LaunchesViewViewModel: ObservableObject {
    
    @State var model: LaunchesViewModel
    
    @Published var readStatus: DataReadStatus
    
    /// Initializer for this ViewModel
    /// - Parameter status: default status of data reading, inconsistent to the other ViewModel, probably could be reworked without an issue
    init(status: DataReadStatus) {
        model = LaunchesViewModel(pinnedLaunches: [], unpinnedLaunches: [])
        self.readStatus = status
        getData()
    }
    
    /// Method for getting data from API for the DailyView to be used in, similar to the LaunchesVIewViewModel method getData
    func getData() {
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
                    postResponse = try JSONDecoder().decode([Launch].self, from: data)
                    self.saveDataToModel(response: postResponse)
                }
                catch {
                    print(error)
                }
            }
            else{
                print("dataTask failed in \(#function)")
            }
        }
        task.resume()
    }
    
    
    /// Method for data saving from the API call response to the model
    /// - Parameter response: API call response
    func saveDataToModel(response: [Launch]) {
        model.unpinnedLaunches = response
        readStatus = .success
    }
    
}
