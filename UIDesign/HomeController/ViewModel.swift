//
//  ViewModel.swift
//  UIDesign
//
//  Created by Pratik Morge on 26/09/23.
//

import Foundation
import UIKit

protocol ViewModelDelegate: MainCoordinator{
    func showLogin()
    func showRegister()
    func instaScreen()
}

class ViewModel {
    var delegates: ViewModelDelegate?
}
