//
//  StartScreenViewModel.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import UIKit

class StartScreenViewModel: BaseViewModel {
    var repository: Repository
    
    @objc dynamic var measurement: Measurement?
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLatestMeasurement()
    }
    
    private func getLatestMeasurement() {
        isLoading = true
        repository.getLatestMeasurement() { result in
            switch result {
            case .success(let measurement):
                self.measurement = measurement
                self.isLoading = false
            case .failure(let error):
                self.isLoading = false
            }
        }
    }
}
