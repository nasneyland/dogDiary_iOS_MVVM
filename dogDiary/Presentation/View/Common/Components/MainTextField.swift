//
//  MainTextField.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import UIKit

class MainTextField: UITextField {
    
    //MARK: - Lifecycle
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        
        configureUI()
    }
    
    //MARK: - Configure
    
    func configureUI() {
        font = .gSans(size: .medium, weight: .medium)
        backgroundColor = UIColor.white
        layer.cornerRadius = ViewConstants.TEXTFIELD_RADIUS
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        
        let leftPaddingView = UIView(frame: .init(x: 0, y: 0, width: ViewConstants.TEXTFIELD_HORIZONTAL_PADDING, height: 0))
        leftView = leftPaddingView
        leftViewMode = .always
        
        let rightPaddingView = UIView(frame: .init(x: 0, y: 0, width: ViewConstants.TEXTFIELD_HORIZONTAL_PADDING, height: 0))
        rightView = rightPaddingView
        rightViewMode = .always
    }
}
