//
//  LoginViewCoordinator.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 21/09/23.
//

import Foundation
import UIKit
class LoginViewCoordinator: BaseCoordinator, Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func start(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        vc?.loginViewMode.delegates = self
        navigationController.show(vc ?? UIViewController(), sender: nil)
    }
}

extension LoginViewCoordinator: LoginViewModelDelegate {
    func myServiceRequestScreen() {
        let myServiceRequestCoordinator = MyServiceRequestCoordinator(navigationController: navigationController )
        coordinators[String(describing: MyServiceRequestCoordinator.self)] = myServiceRequestCoordinator
        myServiceRequestCoordinator.start()
    }
    func dashBoardScreen() {
        let dashBoardCoordinator = DesignUICoordinator(navigationController: navigationController )
        coordinators[String(describing: DesignUICoordinator.self)] = dashBoardCoordinator
        dashBoardCoordinator.start()
    }
}

