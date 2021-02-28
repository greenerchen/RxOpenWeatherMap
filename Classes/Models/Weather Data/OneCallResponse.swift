//
//  OneCallResponse.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/25.
//

import Foundation

struct OneCallResponse {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let timezoneOffset: TimeInterval
    let current: CurrentWeather
    let hourly: [HourlyForecast]
    let daily: [DailyForecast]
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case timezone
        case timezoneOffset = "timezone_offset"
        case current
        case hourly
        case daily
    }
}

extension OneCallResponse: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        timezone = try container.decode(String.self, forKey: .timezone)
        timezoneOffset = try container.decode(TimeInterval.self, forKey: .timezoneOffset)
        current = try container.decode(CurrentWeather.self, forKey: .current)
        hourly = try container.decode([HourlyForecast].self, forKey: .hourly)
        daily = try container.decode([DailyForecast].self, forKey: .daily)
    }
}

extension OneCallResponse {
    init(data: Data, using decoder: JSONDecoder = .init()) throws {
        self = try decoder.decode(OneCallResponse.self, from: data)
    }
}