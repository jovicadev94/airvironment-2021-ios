//
//  MetaPagination.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 6.8.21..
//

import UIKit

public class MetaPagination: NSObject, Codable {
    public var page: Int
    public var perPage: Int
    public var totalCount: Int
    
    public init(page: Int, perPare: Int, totalCount: Int) {
        self.page = page
        self.perPage = perPare
        self.totalCount = totalCount
    }
    
    private enum CodingKeys : String, CodingKey {
        case page
        case perPage = "per_page"
        case totalCount = "total"
    }
}
