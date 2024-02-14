//
//  WelcomeBackCoordinator.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import Foundation

class WelcomeBackCoordinator: Coordinator {
    let presenter: MainNavigationController
    
    init(presenter: MainNavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let vc = WelcomeBackViewController()
        vc.coordinator = self
        presenter.pushViewController(vc, animated: false)
    }
    
    func pushJoinScene() {
        let coordinator = JoinCoordinator(presenter: presenter)
        coordinator.start()
    }
    
    func pushDataBackupScene() {
        let coordinator = DataBackupCoordinator(presenter: presenter)
        coordinator.memberId = UserDefaultsManager.combackUserId
        coordinator.start()
    }
}
