//
//  Repository.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import UIKit

protocol Repository {
    func getMeasurements(parameter: MetaPagination?, result: @escaping ((Result<MetaArrayResponse, Error>) -> Void))
    
    func getLatestMeasurement(result: @escaping ((Result<Measurement, Error>) -> Void))
    
}
