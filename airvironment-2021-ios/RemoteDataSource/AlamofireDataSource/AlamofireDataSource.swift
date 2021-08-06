//
//  AlamofireDataSource.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import UIKit
import Alamofire

class AlamoFireDataSource: RemoteDataSource {
    
    
    func getLatestMeasurement(result: @escaping ((Result<Measurement, Error>) -> Void)) {
        AF.request(Router.Measurements.getLatestMeasurement, interceptor: nil).response { serverResponse in
            switch serverResponse.result {
            case.success(_):
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .custom(JSONDecoder.dateDecodingStrategy)
                    let responseBody: Measurement = try jsonDecoder.decode(Measurement.self, from: serverResponse.data!) as Measurement
                    result(.success(responseBody))
                } catch let error {
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
    
    
    func getMeasurements(parameter: MetaPagination?, result: @escaping ((Result<MetaArrayResponse, Error>) -> Void)) {
        
        AF.request(Router.Measurements.getMeasurements(parameter: parameter), interceptor: nil).response { serverResponse in
            switch serverResponse.result {
            case.success(_):
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .custom(JSONDecoder.dateDecodingStrategy)
                    let responseBody: MetaArrayResponse = try jsonDecoder.decode(MetaArrayResponse.self, from: serverResponse.data!) as MetaArrayResponse
                    result(.success(responseBody))
                } catch let error {
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
    
//    func getMetaData(result: @escaping ((Result<MetaArrayResponse<Measurement>, Error>) -> Void)) {
//        AF.request(Router.Measurements.getMeasurements, interceptor: nil).response { serverResponse in
//            switch serverResponse.result {
//            case.success(_):
//                do {
//                    let jsonDecoder = JSONDecoder()
//                    let responseBody: MetaArrayResponse<Measurement> = try jsonDecoder.decode(MetaArrayResponse<Measurement>.self, from: serverResponse.data!) as MetaArrayResponse<Measurement>
//                    result(.success(responseBody))
//                } catch let error {
//                    result(.failure(error))
//                }
//            case.failure(let error):
//                result(.failure(error))
//            }
//        }
//    }
    
}
