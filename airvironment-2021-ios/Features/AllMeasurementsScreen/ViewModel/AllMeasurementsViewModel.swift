//
//  AllMeasurementsViewModel.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import UIKit

class AllMeasurementsViewModel: BaseViewModel {
    
    var repository: Repository
    
    @objc dynamic var measurements: Array<Measurement>!
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func onViewDidLoad() {
        getMeasurements()
        fetchPages()
    }
    var fetcing: Bool = false
    var currentPage: Int = 1
    var total: Int = 0
    
    func fetchPages() {
        guard !isLoading, currentPage < total
        else {
            return
        }
        currentPage += 1
        getMeasurements(parameter: MetaPagination(page: currentPage, perPare: 10, totalCount: total))
    }
    
    private func getMeasurements(parameter: MetaPagination?=nil) {
        if self.measurements == nil
        {
        self.measurements = []
        }
        isLoading = true
        repository.getMeasurements(parameter: parameter) { result in
            switch result {
            case .success(let measurements):
                for measurement in measurements.response {
                    self.measurements.append(measurement)
                }
                self.currentPage = measurements.meta!.page
                if self.total == 0 {
                    self.total = measurements.meta!.total / measurements.meta!.per_page
                }
//                self.measurements = measurements.response
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        }
    }
    
}
