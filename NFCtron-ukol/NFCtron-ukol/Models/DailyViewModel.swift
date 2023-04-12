//
//  DailyViewModel.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 11.04.2023.
//

import Foundation

class DailyViewModel: ObservableObject {
    
    @Published var title: String?
    
    @Published var description: String?
    
    @Published var imageURL: String?

    @Published var hdImageURL: String?
    
    @Published var date: String?
    
}
