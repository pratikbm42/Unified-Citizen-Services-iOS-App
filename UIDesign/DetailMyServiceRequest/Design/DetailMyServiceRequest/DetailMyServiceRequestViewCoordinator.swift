//
//  DetailMyServiceRequestViewCoordinator.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 11/10/23.
//

import Foundation
import UIKit

class DetailMyServiceRequestViewCoordinator: BaseCoordinator, Coordinator {
    var navigationController: UINavigationController
    required init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailMyServiceRequestViewController") as? DetailMyServiceRequestViewController
        //vc?.viewModel.delegates = self
        navigationController.show(vc ?? UIViewController(), sender: nil)
    }
}
