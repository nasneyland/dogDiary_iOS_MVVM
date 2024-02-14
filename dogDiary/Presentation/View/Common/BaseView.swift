//
//  BaseView.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        binding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    
    func configureUI() { }
    func binding() { }
}
