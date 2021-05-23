//
//  Coordinator.swift
//  IHSMarkitDemo
//
//  Created by Richard Clark on 4/12/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
