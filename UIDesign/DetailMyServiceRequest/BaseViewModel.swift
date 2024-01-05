//
//  CommonViewModel.swift
//  Arlington
//
//  Created by Prasad on 5/7/18.
//  Copyright © 2018 Kahuna Systems. All rights reserved.
//

import UIKit
@objc protocol BaseViewModelDelegate: AnyObject {
    /// Remove all coordinator objects
    func clearAllCoordinatores()
}

class BaseViewModel: NSObject {
    weak var baseViewModelDelegate: BaseViewModelDelegate?
    /// Call delegate to clear coordinator objects
    func clearCoordinatorObjects() {
        baseViewModelDelegate?.clearAllCoordinatores()
    }
}
