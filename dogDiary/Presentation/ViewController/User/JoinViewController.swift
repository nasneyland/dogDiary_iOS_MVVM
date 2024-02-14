//
//  JoinViewController.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import UIKit
import RxRelay

class JoinViewController: BaseViewController {
    
    var coordinator: JoinCoordinator?
    
    private let selfView = JoinView()
    
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
        let tapAgreeAndStartButton = selfView.agreeAndStartButton.rx.tap.asObservable()
        
        tapAgreeAndStartButton
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: {[weak self] in
                self?.coordinator?.pushHomeScene()
            })
            .disposed(by: disposeBag)
    }
}
