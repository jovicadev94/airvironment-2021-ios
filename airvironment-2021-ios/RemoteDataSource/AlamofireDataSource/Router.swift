//
//  Router.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import Foundation
import Alamofire

struct Router {
    
    public static var baseURL: URL = URL(string: "https://airvironment.live/api")!
    
    enum Measurements: URLRequestConvertible {
        case getMeasurements(parameter: MetaPagination?)
        case getLatestMeasurement

        
        var resource: String {
            switch self {
            case .getMeasurements: return "/measurements"
            case .getLatestMeasurement: return "/measurements/latest"
            }
        }
        
        var method: HTTPMethod {
            switch self{
            case .getMeasurements: return .get
            case .getLatestMeasurement: return .get
            }
        }
        
        var path: String {
            switch self {
            case .getMeasurements: return resource
            case .getLatestMeasurement: return resource
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            var request = URLRequest(url: baseURL.appendingPathComponent(path))
            request.method = method
            
            switch self {
            case let .getMeasurements(parameters):
                request = try URLEncoding.default.encode(request, with: parameters?.encode())
            case .getLatestMeasurement:
                break
            }

            return request
        }
    }
}
