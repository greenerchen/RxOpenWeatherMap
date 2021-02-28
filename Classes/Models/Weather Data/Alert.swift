//
//  Alert.swift
//  OpenWeatherNetworking
//
//  Created by Greener Chen on 2021/2/28.
//

import Foundation

struct Alert {
    let senderName: String
    let event: String
    let start: TimeInterval
    let end: TimeInterval
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case senderName = "sender_name"
        case event
        case start
        case end
        case description
    }
}

extension Alert: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        senderName = try container.decode(String.self, forKey: .senderName)
        event = try container.decode(String.self, forKey: .event)
        start = try container.decode(TimeInterval.self, forKey: .start)
        end = try container.decode(TimeInterval.self, forKey: .end)
        description = try container.decode(String.self, forKey: .description)
    }
}