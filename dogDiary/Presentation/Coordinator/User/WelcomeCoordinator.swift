//
//  WelcomeCoordinator.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation

class WelcomeCoordinator: Coordinator {
    let presenter: MainNavigationController
    
    init(presenter: MainNavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let vc = WelcomeViewController()
        vc.coordinator = self
        presenter.pushViewController(vc, animated: false)
    }
    
    func pushJoinScene() {
        let coordinator = JoinCoordinator(presenter: presenter)
        coordinator.start()
    }
    
    func pushFindAuthScene() {
        let coordinator = FindAuthCoordinator(presenter: presenter)
        coordinator.start()
    }
}
