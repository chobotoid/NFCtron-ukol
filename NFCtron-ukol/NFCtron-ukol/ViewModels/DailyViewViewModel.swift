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
    
//    @Binding var title: String
    
//    @Binding var description: String
    
    init() {
        model = DailyViewModel()
        self.readStatus = .initial
        getData()
//        self._title = self.$model.title
//        self._title = title
//        self._description = description
//        self._readStatus = readStatus
    }
    
    func getData() {
        print("Starting")
        readStatus = .started
        let tmpUrl = URL(string: "https://api.nasa.gov/planetary/apod?api_key=Nbn5aYAM5G6ZHd00OdTjfi3AfhuKaLj2vXYJqdYc")
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
                let postResponse: URLResponse
                do {
//                        self.input = "ahoj"
                    print("BEFORE DECODING")
//                    print(String(data: data, encoding: .utf8))
                    postResponse = try JSONDecoder().decode(URLResponse.self, from: data)
                    print("AFTER DECODING")
                    print(postResponse)
                    self.saveDataToModel(response: postResponse)
                }
                catch {
                    print(error)
                }
            }
            else{
                print("ELSE")
            }
        }
        task.resume()
        print("ENDING")
    }
    
    func saveDataToModel(response: URLResponse) {
        model.title = response.title
        model.description = response.explanation
        model.date = response.date
        model.imageURL = response.url
        model.hdImageURL = response.hdurl
//        print(model)
        readStatus = .success
//        response.
    }
    
}
