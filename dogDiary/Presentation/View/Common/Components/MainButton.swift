//
//  MainButton.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import UIKit

class MainButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? .main : .gray
        }
    }
    
    //MARK: - Lifecycle
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: state)
        titleLabel?.font = .gSans(size: .medium, weight: .medium)
        
        configureUI()
    }
    
    //MARK: - Configure
    
    func configureUI() {
        layer.cornerRadius = ViewConstants.BUTTON_RADIUS
        clipsToBounds = true
        isEnabled = true
        setTitleColor(.white, for: .normal)
    }
}
