//
//  MetaData.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import UIKit

class MetaData: NSObject, Codable {
    var page: Int
    var per_page: Int
    var total: Int
    
    public init(page: Int, per_page: Int, total:Int) {
        self.page = page
        self.per_page = per_page
        self.total = total
    }
}
