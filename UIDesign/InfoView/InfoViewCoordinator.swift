//
//  InfoViewCoordinator.swift
//  UIDesign
//
//  Created by Pratiksha Jagtap on 13/10/23.
//

import UIKit
import Foundation

class InfoViewCoordinator: BaseCoordinator, Coordinator {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController
        navigationController.show(vc ?? UIViewController(), sender: nil)
    }
}
