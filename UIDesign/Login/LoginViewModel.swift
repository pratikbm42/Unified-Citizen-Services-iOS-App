//
//  LoginViewModel.swift
//  UIDesign
//
//  Created by Pratik Morge on 21/09/23.
//


import Foundation
import UIKit

protocol LoginViewModelDelegate: LoginViewCoordinator{
    func myServiceRequestScreen()
    func dashBoardScreen()
}


class LoginViewModel {
    
    var delegates: LoginViewModelDelegate?
}

