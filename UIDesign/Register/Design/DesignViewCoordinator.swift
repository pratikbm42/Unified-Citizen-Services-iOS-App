//
//  DesignViewCoordinator.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 28/09/23.
//

import Foundation
import UIKit
class DesignViewCoordinator: BaseCoordinator, Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func start(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DesignViewController") as? DesignViewController
        navigationController.show(vc ?? UIViewController(), sender: nil)
    }
    
    
}




