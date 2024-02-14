//
//  JoinView.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import UIKit

class JoinView: BaseView {
    
    //MARK: - Properties
    
    private let titleText = "이용약관동의"
    private let inputPlaceholder = "이용약관동의 구현"
    private let mainButtonText = "동의하고 시작"
    
    //MARK: - UI Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = titleText
        label.font = .gSans(size: .big, weight: .medium)
        return label
    }()
    
    lazy var inputTextField: MainTextField = {
        let textField = MainTextField(placeholder: inputPlaceholder)
        return textField
    }()
    
    lazy var agreeAndStartButton: MainButton = {
        let button = MainButton(title: mainButtonText)
        return button
    }()
    
    //MARK: - Configure
    
    override func configureUI() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(ViewConstants.VIEW_PADDING)
//            make.leading.equalToSuperview().inset(ViewConstants.VIEW_PADDING)
            make.centerX.equalToSuperview()
        }
        
        addSubview(inputTextField)
        inputTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(ViewConstants.VIEW_PADDING)
            make.height.equalTo(ViewConstants.TEXTFIELD_HEIGHT)
        }
        
        addSubview(agreeAndStartButton)
        agreeAndStartButton.snp.makeConstraints { make in
            make.top.equalTo(inputTextField.snp.bottom).offset(8)
//            make.bottom.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(ViewConstants.VIEW_PADDING)
            make.height.equalTo(ViewConstants.BUTTON_HEIGHT)
        }
    }
}
