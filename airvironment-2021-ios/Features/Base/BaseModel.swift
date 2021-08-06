//
//  BaseModel.swift
//  airvironment-2021-ios
//
//  Created by Letnja Praksa 3 on 23.7.21..
//



import UIKit

open class BaseViewModel: NSObject {
    
    @objc public dynamic var isLoading: Bool = false
    
    open func viewDidLoad() {}
    
    open func onViewVisible() {}
    
    open func onViewNotVisible() {}
}
