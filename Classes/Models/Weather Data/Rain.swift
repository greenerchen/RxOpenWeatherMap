//
//  Rain.swift
//  WeatherApp-MVVMC
//
//  Created by Greener Chen on 2021/2/26.
//

import Foundation

struct Rain {
    let last1h: Int
    let last3h: Int?
    
    enum CodingKeys: String, CodingKey {
        case last1h = "1h"
        case last3h = "3h"
    }
}

extension Rain: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        last1h = try container.decode(Int.self, forKey: .last1h)
        last3h = try container.decodeIfPresent(Int.self, forKey: .last3h) 
    }
}