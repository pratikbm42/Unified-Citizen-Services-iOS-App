//
//  RegisterViewModel.swift
//  UIDesign
//
//  Created by Pratik Morge on 21/09/23.
//

import Foundation
import UIKit


protocol RegisterViewModelDelegate: RegisterViewCoordinator{
    
    func infoViewScreen()
    func homeScreen()
    
}

class RegisterViewModel {
    
    var delegates: RegisterViewModelDelegate?
    
}
