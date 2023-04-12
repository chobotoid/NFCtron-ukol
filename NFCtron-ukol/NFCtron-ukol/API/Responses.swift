//
//  HTTPResponse.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 11.04.2023.
//

import Foundation

struct URLResponse: Decodable {
    
    var error: CustomError?
    
    let copyright: String
    
    let date: String
    
    let explanation: String
    
    let hdurl: String
    
    let media_type: String
    
    let service_version: String
    
    let title: String
    
    let url: String
    
}

struct CustomError: Decodable {
    
    var code: String
    
    var message: String
    
}
