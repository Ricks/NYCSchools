//
//  MainCoordinator.swift
//  NYCSchools
//
//  Created by Richard Clark on 5/23/21.
//

import UIKit

class MainCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = SchoolListController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

}

