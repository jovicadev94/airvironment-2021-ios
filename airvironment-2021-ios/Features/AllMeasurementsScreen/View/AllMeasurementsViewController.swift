//
//  AllMeasurementsViewController.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import UIKit

class AllMeasurementsViewController: BaseViewController<AllMeasurementsViewModel> {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var measurementsTableView: UITableView!
    
    
    override init() {
        super.init()
        viewModel =  AllMeasurementsViewModel(repository: RepositoryImplementation())
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var nameObserver: NSKeyValueObservation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        measurementsTableView.register(UINib(nibName: AllMeasurementsViewCell.reusableIdentifier(), bundle: nil), forCellReuseIdentifier: AllMeasurementsViewCell.reusableIdentifier())
        observeLiveData()
        viewModel.onViewDidLoad()
        
        
    }
    
    override func observeLiveData() {
        super.observeLiveData()
        nameObserver = viewModel.observe(\.measurements, options: .new) { _, measurements  in
            if let measurements = measurements.newValue {
                
                self.measurementsTableView.dataSource = self
                self.measurementsTableView.reloadData()

            }
            
        }
    }

}

extension AllMeasurementsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.measurements!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllMeasurementsViewCell.reusableIdentifier(), for: indexPath) as! AllMeasurementsViewCell
        if let measurements = viewModel.measurements {
            cell.configure(measurement: measurements[indexPath.row])
        }
        let needFetch = indexPath.row >= self.viewModel.measurements!.count - 1
        if needFetch {
            self.viewModel.fetchPages()
        }
        
        return cell
    }
    
}

