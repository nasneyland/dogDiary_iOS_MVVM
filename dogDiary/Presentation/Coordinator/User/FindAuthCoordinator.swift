//
//  FindAuthCoordinator.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation

class FindAuthCoordinator: Coordinator {
    let presenter: MainNavigationController
    
    init(presenter: MainNavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let dataSource = AuthDataSource()
        let repository = AuthRepositoryImpl(dataSource: dataSource)
        let usecase = AuthUseCase(repository: repository)
        let viewModel = FindAuthViewModel(dependencies: .init(usecase: usecase))
        let vc = FindAuthViewController(viewModel: viewModel)
        vc.coordinator = self
        presenter.pushViewController(vc, animated: false)
    }
    
    func pushDataBackupScene(memberId: String) {
        let coordinator = DataBackupCoordinator(presenter: presenter)
        coordinator.memberId = memberId
        coordinator.start()
    }
}
