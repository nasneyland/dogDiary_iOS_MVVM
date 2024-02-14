//
//  DataBackupViewController.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import UIKit
import RxRelay

class DataBackupViewController: BaseViewController {
    
    var coordinator: DataBackupCoordinator?
    
    private let viewModel: DataBackupViewModel
    private let selfView = DataBackupView()
    
    //MARK: - Lifecycle
    
    init(viewModel: DataBackupViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    
    override func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(selfView)
        selfView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func binding() {
        let fetching = rx.viewWillAppear.take(1).map { _ in }
        
        let output = viewModel.transform(input: .init(fetching: fetching))

        output.finishBackup
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { [weak self] data in
                self?.coordinator?.pushHomeScene()
            })
            .disposed(by: disposeBag)
    }
}
