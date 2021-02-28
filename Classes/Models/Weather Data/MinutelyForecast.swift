//
//  MinutelyForecast.swift
//  OpenWeatherNetworking
//
//  Created by Greener Chen on 2021/2/28.
//

import Foundation

struct MinutelyForecast {
    let dt: TimeInterval
    let precipitation: Int
    
    enum CodingKeys: String, CodingKey {
        case dt
        case precipitation
    }
}

extension MinutelyForecast: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dt = try container.decode(TimeInterval.self, forKey: .dt)
        precipitation = try container.decode(Int.self, forKey: .precipitation)
    }
}