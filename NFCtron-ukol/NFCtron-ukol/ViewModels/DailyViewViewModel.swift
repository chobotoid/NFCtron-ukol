//
//  DailyViewViewModel.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 11.04.2023.
//

import SwiftUI

enum DataReadStatus: DynamicProperty {
    case initial
    case started
    case success
    case failure
}

class DailyViewViewModel: ObservableObject {
    
    @State var model: DailyViewModel
    
    @Published var readStatus: DataReadStatus
    
    init() {
        model = DailyViewModel()
        self.readStatus = .initial
        getData()
    }
    
    /// Method for getting data from api and saving them into model (through saveDataToModel method)
    func getData() {
        readStatus = .started
        let tmpUrl = URL(string: "https://api.nasa.gov/planetary/apod?api_key=Nbn5aYAM5G6ZHd00OdTjfi3AfhuKaLj2vXYJqdYc")
        guard let url = tmpUrl else{
            print("URL FAILED in \(#function)")
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
                let postResponse: DailyURLResponse
                do {
                    postResponse = try JSONDecoder().decode(DailyURLResponse.self, from: data)
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
    
    
    
    /// method for data saving from API call response to model
    /// - Parameter response: response of the API in form of JSON decoded struct (similar to model, might not be needed to have those 2 structs separated)
    func saveDataToModel(response: DailyURLResponse) {
        model.title = response.title
        model.description = response.explanation
        model.date = response.date
        model.imageURL = response.url
        model.hdImageURL = response.hdurl
        readStatus = .success
    }
    
}
