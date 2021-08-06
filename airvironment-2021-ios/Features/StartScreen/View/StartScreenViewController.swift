//
//  StartScreenViewController.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import UIKit
import Kingfisher

class StartScreenViewController: BaseViewController<StartScreenViewModel> {
    @IBOutlet weak var lastUpdated: UILabel!
    @IBOutlet weak var pol: UILabel!
    @IBOutlet weak var hum: UILabel!
    @IBOutlet weak var temp: UILabel!
    
    @IBOutlet weak var header: UILabel!
    
    override init() {
        super.init()
        viewModel =  StartScreenViewModel(repository: RepositoryImplementation())
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var nameObserver: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        let loader = self.loader()
    //        DispatchQueue.global(qos: .background).async {
    //
    //            DispatchQueue.main.async {
    //                self.stopLoader(loader: loader)
    //            }
    //        }
    //    }
    
    override func observeLiveData() {
        super.observeLiveData()
        nameObserver = viewModel.observe(\.measurement, options: .new) { _, measurement  in
            if let measurement = measurement.newValue{
                let tempsign = "°"
                let tempstring = String(measurement!.temperature)
                self.temp.text = "\(tempstring)\(tempsign)"
                self.hum.text = String(measurement!.humidity)
                let polsign = "ppb"
                let pollution = String(measurement!.pollution)
                self.pol.text = "\(pollution)\(polsign)"
                let dateformater = DateFormatter()
                dateformater.dateFormat = "YY/MM/dd HH:mm:ss"
                let newdate:String = dateformater.string(from: measurement!.created)
                self.lastUpdated.text = "Updated At: \(newdate)"
            }
        }
    }
    
    @IBAction func onButtonTapped(_ sender: UIButton) {
        navigationController!.show((AllMeasurementsViewController()), sender: nil)
        
        //        self.navigationController pushViewController:viewController animated:YES
    }
    
    
}
