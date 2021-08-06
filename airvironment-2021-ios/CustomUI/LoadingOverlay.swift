//
//  LoadingOverlay.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 23.7.21..
//

import UIKit

class LoadingOverlay: UIView {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    private func xibSetup() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        
        activityIndicator.style = .large
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: (type(of: self)))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    func show(in view: UIView) {
        self.frame = view.bounds
        view.addSubview(self)
    }
    
    func show() {
        let window = ViewUtils.getKeyWindow()!
        self.frame = window.bounds
        window.addSubview(self)
    }
    
    func hide() {
        self.removeFromSuperview()
    }
}
