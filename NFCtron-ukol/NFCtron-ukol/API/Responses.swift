//
//  HTTPResponse.swift
//  NFCtron-ukol
//
//  Created by Jan Gutwirth on 11.04.2023.
//

import SwiftUI

/// API response for DailyView data
struct DailyURLResponse: Decodable {
    
    var error: CustomError?
    
    let copyright: String?
    
    let date: String?
    
    let explanation: String?
    
    let hdurl: String?
    
    let media_type: String?
    
    let service_version: String?
    
    let title: String?
    
    let url: String?
    
}

struct CustomError: Decodable {
    
    var code: String?
    
    var message: String?
    
}

/// Struct for holding response and data of one launch for LaunchView to be used in
struct Launch: Decodable {
    
    var uid: UUID = UUID()
    
    var links: CustomLinks?
    
    var date_utc: String?
    
    var name: String?
    
    var details: String?
    
    enum CodingKeys: String, CodingKey {
        case links
        case date_utc
        case name
        case details
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        links = try container.decodeIfPresent(CustomLinks.self, forKey: .links)
        date_utc = try container.decodeIfPresent(String.self, forKey: .date_utc)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        details = try container.decodeIfPresent(String.self, forKey: .details)
    }
    
    init(links: CustomLinks, static_fire_date_utc: String, name: String, details: String) {
        self.links = links
        self.date_utc = static_fire_date_utc
        self.name = name
        self.details = details
        self.uid = UUID()
    }
}

struct CustomLinks: Decodable {
    
    var webcast: String?
    
    var wikipedia: String?
    
}
