//
//  MetaArrayResponse.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import UIKit

class MetaArrayResponse: NSObject, Codable {
    var meta: MetaData?
    var response: Array<Measurement>
    
    public init(meta: MetaData? = nil, results: Array<Measurement>) {
        self.meta = meta
        self.response = results
        
    }
}
