//
//  WelcomeBackViewController.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import UIKit
import SnapKit
import RxViewController

class WelcomeBackViewController: BaseViewController {
    
    var coordinator: WelcomeBackCoordinator?
    
    private let selfView = WelcomeBackView()
    
    //MARK: - Lifecycle
    
    init() {
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
        let tapDataBackupButton = selfView.mainButton.rx.tap.asObservable()
        let tapRestartButton = selfView.subButton.rx.tap.asObservable()
        
        tapDataBackupButton
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
                self?.coordinator?.pushDataBackupScene()
            })
            .disposed(by: disposeBag)
        
        tapRestartButton
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
                self?.coordinator?.pushJoinScene()
            })
            .disposed(by: disposeBag)
    }
}
