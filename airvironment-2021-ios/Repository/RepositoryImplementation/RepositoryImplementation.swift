//
//  RepositoryImplementation.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import UIKit

class RepositoryImplementation: Repository {
    
    
    var remoteDataSource: RemoteDataSource = AlamoFireDataSource()
    
    func getLatestMeasurement(result: @escaping ((Result<Measurement, Error>) -> Void)) {
        remoteDataSource.getLatestMeasurement(result: result)
    }
    
    func getMeasurements(parameter: MetaPagination?, result: @escaping ((Result<MetaArrayResponse, Error>) -> Void)) {
        remoteDataSource.getMeasurements(parameter: parameter, result: result)
    }
    
    
}
