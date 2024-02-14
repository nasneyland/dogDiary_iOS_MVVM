//
//  JoinCoordinator.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation

class JoinCoordinator: Coordinator {
    let presenter: MainNavigationController
    
    init(presenter: MainNavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let vc = JoinViewController()
        vc.coordinator = self
        presenter.pushViewController(vc, animated: false)
    }
    
    func pushHomeScene() {
        UserDefaultsManager.isLoggedIn = true // 로그인 처리
        
        let coordinator = HomeCoordinator(presenter: presenter)
        coordinator.start()
    }
}
