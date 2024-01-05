//
//  MainCoordinator.swift
//  mvvmc
//
//  Created by Mac on 26/06/1945 Saka.
//

import UIKit
import Foundation
import UIKit
class MainCoordinator: BaseCoordinator,Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func start(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        vc?.viewModel.delegates = self
        navigationController.show(vc ?? UIViewController(), sender: nil)
    }
}

extension MainCoordinator : ViewModelDelegate {
    func showLogin(){
        let loginViewCoordinator = LoginViewCoordinator(navigationController: navigationController )
        coordinators[String(describing: LoginViewCoordinator.self)] = loginViewCoordinator
        loginViewCoordinator.start()
    }
    
    func showRegister(){
        let registerViewCoordinator = RegisterViewCoordinator(navigationController: navigationController )
        coordinators[String(describing: RegisterViewCoordinator.self)] = registerViewCoordinator
        registerViewCoordinator.start()
    }
    func instaScreen(){
        let designViewCoordinator = InstaCoordinator(navigationController: navigationController )
        coordinators[String(describing: InstaCoordinator.self)] = designViewCoordinator
        designViewCoordinator.start()
    }
    
}



