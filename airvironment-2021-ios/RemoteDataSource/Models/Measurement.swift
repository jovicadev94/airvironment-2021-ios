//
//  Measurement.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import UIKit

class Measurement: NSObject, Codable {
    var id: Int
    var temperature: Float
    var humidity: Float
    var pollution: Float
    var created: Date
    
    init(id: Int, temperature: Float, humidity: Float, pollution: Float, created: Date) {
        self.id = id
        self.temperature = temperature
        self.humidity = humidity
        self.pollution = pollution
        self.created = created
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case temperature
        case humidity
        case pollution
        case created
    }
}
