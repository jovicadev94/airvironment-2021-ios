//
//  BaseViewController.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 23.7.21..
//
import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
var viewModel: T!
    var loadingOverlay: LoadingOverlay!
    private var isLoadingObserver: NSKeyValueObservation!
    
    public init() {
        let nibName = String(describing: Self.self)
        let bundle = Bundle(for: Self.classForCoder())
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        loadingOverlay = LoadingOverlay(frame: self.view.bounds)
        observeLiveData()
        viewModel.viewDidLoad()
    }
    
    open func observeLiveData() {
        isLoadingObserver = viewModel.observe(\.isLoading, options: .new) { _, isLoading  in
            if isLoading.newValue ?? false {
                self.showLoadingView()
            } else {
                self.hideLoadingView()
            }
        }
    }
    
    private func showLoadingView() {
        loadingOverlay.show()
    }
    
    private func hideLoadingView() {
        loadingOverlay.hide()
    }
}
