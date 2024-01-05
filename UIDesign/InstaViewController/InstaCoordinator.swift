//
//  InstaCoordinator.swift
//  UIDesign
//
//  Created by Pratik Morge on 02/11/23.
//

import Foundation
import UIKit
class InstaCoordinator: BaseCoordinator, Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func start() {
        guard let vc = InstaViewController.instanceController(StoryBoards.design) as? InstaViewController else {
            return
        }
        self.navigationController.pushViewController(vc, animated: true)
    }
}
