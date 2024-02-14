//
//  WelcomeBackView.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import UIKit

class WelcomeBackView: BaseView {
    
    //MARK: - Properties
    
    private let titleText = AppInfo.APP_NAME
    private let infoText = """
                    안녕하세요!
                    우리엔입니다.
                    반려동물 모바일 진료수첩인 우리엔 앱을 사용하는 병원과 보호자 분들의 편의성을 높이기 위하여 UX와 디자인을 개선하여 새로워진 앱으로 런칭합니다.
                    주요 개편 사항을 아래에서 확인하시고 8월 중 새로워진 우리엔 앱을 만나보세요!
                    """
    private let mainButtonText = "데이터 백업"
    private let subButtonText = "처음부터 시작하기"
    
    //MARK: - UI Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = titleText
        label.font = .gSans(size: .big, weight: .bold)
        return label
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .gSans(size: .medium, weight: .medium)
        label.text = infoText
        return label
    }()
    
    lazy var mainButton: MainButton = {
        let button = MainButton(title: mainButtonText)
        return button
    }()
    
    lazy var subButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(subButtonText, for: .normal)
        return button
    }()
    
    //MARK: - Configure
    
    override func configureUI() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(ViewConstants.VIEW_PADDING)
            make.centerX.equalToSuperview()
        }
        
        addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(ViewConstants.VIEW_PADDING)
            make.centerX.equalToSuperview()
        }
        
        addSubview(mainButton)
        mainButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(ViewConstants.VIEW_PADDING)
            make.height.equalTo(ViewConstants.BUTTON_HEIGHT)
        }
        
        addSubview(subButton)
        subButton.snp.makeConstraints { make in
            make.top.equalTo(mainButton.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(ViewConstants.VIEW_PADDING)
        }
    }
}
