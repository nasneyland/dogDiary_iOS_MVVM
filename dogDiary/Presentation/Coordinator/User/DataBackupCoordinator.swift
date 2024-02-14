//
//  DataBackupCoordinator.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import Foundation

class DataBackupCoordinator: Coordinator {
    let presenter: MainNavigationController
    
    var memberId: String?
    
    init(presenter: MainNavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        guard let id = memberId else { return }
        
        let dataSource = AuthDataSource()
        let repository = AuthRepositoryImpl(dataSource: dataSource)
        let usecase = AuthUseCase(repository: repository)
        let viewModel = DataBackupViewModel(dependencies: .init(usecase: usecase, memberId: id))
        let vc = DataBackupViewController(viewModel: viewModel)
        vc.coordinator = self
        presenter.pushViewController(vc, animated: false)
    }
    
    func pushHomeScene() {
        UserDefaultsManager.isLoggedIn = true // 로그인 처리
        
        let coordinator = HomeCoordinator(presenter: presenter)
        coordinator.start()
    }
}
