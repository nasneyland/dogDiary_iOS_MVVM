//
//  DataBackupView.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import UIKit

class DataBackupView: BaseView {
    
    //MARK: - Properties
    
    private let titleText = "데이터 백업 중"
    
    //MARK: - UI Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = titleText
        label.font = .gSans(size: .big, weight: .medium)
        return label
    }()
    
    //MARK: - Configure
    
    override func configureUI() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
