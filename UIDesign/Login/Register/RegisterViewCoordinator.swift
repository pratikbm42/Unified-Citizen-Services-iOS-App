//
//  RegisterViewCoordinator.swift
//  UIDesign
//
//  Created by Pratik Morge on 21/09/23.
//
import Foundation
import UIKit
class RegisterViewCoordinator: BaseCoordinator, Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func start(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        vc?.registerViewModel.delegates = self
        navigationController.show(vc ?? UIViewController(), sender: nil)
    }
}

extension RegisterViewCoordinator: RegisterViewModelDelegate {
    func infoViewScreen() {
        let infoViewCoordinator = InfoViewCoordinator(navigationController: navigationController )
        coordinators[String(describing: InfoViewCoordinator.self)] = infoViewCoordinator
        infoViewCoordinator.start()
    }
    func homeScreen() {
        let homeScreenCoordinator = DesignViewCoordinator(navigationController: navigationController )
        coordinators[String(describing: DesignViewCoordinator.self)] = homeScreenCoordinator
        homeScreenCoordinator.start()
    }
}

