//
//  BaseCoordinator.swift
//  Arlington
//
//  Created by Prasad on 5/7/18.
//  Copyright © 2018 Kahuna Systems. All rights reserved.
//

import UIKit

class BaseCoordinator: BaseViewModelDelegate {
    /// Dictionary with coordinator class object and class name as a key
    /// E.g. coordinators[String(describing: MyCoordinator.self)] = myCoordinator
    var coordinators = [String: Coordinator]()
    /// Remove all coordinator objects from array
    func clearAllCoordinatores() {
        coordinators.removeAll()
    }
}
