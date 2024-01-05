//
//  DesignUICoordinator.swift
//  UIDesign
//
//  Created by Pratik Morge on 03/10/23.
//

import Foundation
import UIKit

class DesignUICoordinator: BaseCoordinator, Coordinator {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DesignUIViewController") as? DesignUIViewController
        vc?.viewModel.delegates = self
        navigationController.show(vc ?? UIViewController(), sender: nil)
    }
}
extension DesignUICoordinator: DesignUIViewModelDelegate {
    
    func mySRScreen() {
        let mySRCoordinator = MyServiceRequestCoordinator(navigationController: navigationController )
        coordinators[String(describing: MyServiceRequestCoordinator.self)] = mySRCoordinator
        mySRCoordinator.start()
    }
    func infoScreen() {
        let infoCoordinator = InfoViewCoordinator(navigationController: navigationController )
        coordinators[String(describing: InfoViewCoordinator.self)] = infoCoordinator
        infoCoordinator.start()
    }
}
