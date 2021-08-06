//
//  AllMeasurementsViewCell.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 22.7.21..
//

import UIKit

class AllMeasurementsViewCell: UITableViewCell {
    @IBOutlet weak var pol: UILabel!
    @IBOutlet weak var hum: UILabel!
    @IBOutlet weak var temp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func  configure(measurement: Measurement) {
//        temp.text = String(measurement.temperature)
//        hum.text = String(measurement.humidity)
//        pol.text = String(measurement.pollution)
        let tempsign = "°"
        let tempstring = String(measurement.temperature)
        self.temp.text = "\(tempstring)\(tempsign)"
        self.hum.text = String(measurement.humidity)
        let polsign = "ppb"
        let pollution = String(measurement.pollution)
        self.pol.text = "\(pollution)\(polsign)"
        
    }
    
}

extension UITableViewCell {
    static func reusableIdentifier() -> String {
        String(describing: Self.self)
    }
}

