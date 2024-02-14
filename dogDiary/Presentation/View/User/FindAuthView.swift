//
//  FindAuthView.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import UIKit

class FindAuthView: BaseView {
    
    //MARK: - Properties
    
    private let titleText = "기존 회원 인증"
    private let inputPlaceholder = "핸드폰번호를 입력해주세요."
    private let mainButtonText = "인증하기"
    
    //MARK: - UI Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = titleText
        label.font = .gSans(size: .big, weight: .medium)
        return label
    }()
    
    lazy var inputTextField: MainTextField = {
        let textField = MainTextField(placeholder: inputPlaceholder)
        textField.keyboardType = .numberPad
        return textField
    }()
    
    lazy var validateButton: MainButton = {
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
        
        addSubview(validateButton)
        validateButton.snp.makeConstraints { make in
            make.top.equalTo(inputTextField.snp.bottom).offset(8)
//            make.bottom.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(ViewConstants.VIEW_PADDING)
            make.height.equalTo(ViewConstants.BUTTON_HEIGHT)
        }
    }
}
