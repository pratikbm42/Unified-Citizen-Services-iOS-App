//
//  MyServiceRequestCoordinator.swift
//  UIDesign
//
//  Created by Pratik Morge on 06/10/23.
//

import Foundation
import UIKit
class MyServiceRequestCoordinator: BaseCoordinator, Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func start(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyServiceRequestViewController") as? MyServiceRequestViewController
        vc?.viewModel.delegates = self
        navigationController.show(vc ?? UIViewController(), sender: nil)
    }
}
extension MyServiceRequestCoordinator: MyServiceRequestDelegate {
    
    func detailSRScreen() {
        let detailSRCoordinator = DetailMyServiceRequestViewCoordinator(navigationController: navigationController)
        coordinators[String(describing: DetailMyServiceRequestViewCoordinator.self)] = detailSRCoordinator
        detailSRCoordinator.start()
    }
}
