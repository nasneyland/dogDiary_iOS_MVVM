//
//  WelcomeViewController.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import UIKit
import SnapKit
import RxViewController

class WelcomeViewController: BaseViewController {
    
    var coordinator: WelcomeCoordinator?
    
    private let selfView = WelcomeView()
    
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
        let tapStartButton = selfView.mainButton.rx.tap.asObservable()
        let tapFindAuthButton = selfView.subButton.rx.tap.asObservable()
        
        tapStartButton
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
                self?.coordinator?.pushJoinScene()
            })
            .disposed(by: disposeBag)
        
        tapFindAuthButton
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
                self?.coordinator?.pushFindAuthScene()
            })
            .disposed(by: disposeBag)
    }
}
