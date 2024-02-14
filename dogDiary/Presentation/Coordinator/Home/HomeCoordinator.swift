//
//  HomeCoordinator.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import Foundation

class HomeCoordinator: Coordinator {
    var presenter: MainNavigationController
    
    init(presenter: MainNavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let vc = HomeViewController()
        vc.coordinator = self
        presenter.viewControllers = [vc] // 홈화면부터 Nav 새로 시작
    }
}
