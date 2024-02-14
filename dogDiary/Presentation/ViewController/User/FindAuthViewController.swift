//
//  FindAuthViewController.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import UIKit
import RxRelay

class FindAuthViewController: BaseViewController {
    
    var coordinator: FindAuthCoordinator?
    
    private let viewModel: FindAuthViewModel
    private let selfView = FindAuthView()
    
    //MARK: - Lifecycle
    
    init(viewModel: FindAuthViewModel) {
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
        
        //MARK: INPUT
        
        let inputText = PublishRelay<String>() // 실시간 EditText 받기
        let editTextField = selfView.inputTextField.rx.text.orEmpty.asObservable()
        let tapValidateButton = selfView.validateButton.rx.tap.withLatestFrom(inputText).asObservable()
        
        //MARK: BINDS
        
        editTextField.bind { [weak self] value in
            guard let self = self else { return }
            
            inputText.accept(value)
            self.selfView.validateButton.isEnabled = (value.count != 0)
        }
        .disposed(by: disposeBag)
        
        //MARK: OUTPUT
        
        let output = viewModel.transform(input: .init(tapValidateButton: tapValidateButton))

        output.successFindAuth
            .asDriver(onErrorJustReturn: "")
            .drive(onNext: { id in
                self.coordinator?.pushDataBackupScene(memberId: id)
            })
            .disposed(by: disposeBag)
        
        output.failFindAuth
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { _ in
                // 에러 팝업 띄우기
                let popup = MainPopupViewController(title: "알림", content: "존재하지 않는 회원입니다.")
                popup.show(parent: self, completion: nil)
                popup.okButton.rx.tap
                    .bind { _ in
                        popup.dismiss(animated: false, completion: nil)
                    }
                    .disposed(by: popup.disposeBag)
            })
            .disposed(by: disposeBag)
    }
}
