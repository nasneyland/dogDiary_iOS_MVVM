//
//  MainPopupViewController.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: TODO - POPUP 디자인바꾸기
class MainPopupViewController: BaseViewController {
    
    //MARK: - Properties
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .gSans(size: .big)
        label.textAlignment = .center
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .gSans(size: .medium)
        label.textAlignment = .center
        return label
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .gSans(size: .medium)
        return button
    }()
    
    let okButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .gSans(size: .medium)
        return button
    }()
    
    //MARK: - Lifecycles
    
    init(title: String, content: String) {
       
        titleLabel.text = title
        contentLabel.text = content
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    //MARK: - Configures
    
    override func configureUI() {
        view.backgroundColor = .black.withAlphaComponent(0.15)
        
        let contentView = UIView()
        contentView.layer.cornerRadius = 24
        contentView.backgroundColor = .white
        
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.width.equalTo(270)
            make.center.equalToSuperview()
        }
     
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
            make.height.greaterThanOrEqualTo(21)
        }
        
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
            make.height.greaterThanOrEqualTo(21)
        }
        
        let divider = UIView()
        divider.backgroundColor = .gray
        contentView.addSubview(divider)
        divider.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        let centerDivider = UIView()
        centerDivider.backgroundColor = .gray
        
        let actionStackView = UIStackView(arrangedSubviews: [cancelButton, centerDivider, okButton])
        actionStackView.distribution = .fillProportionally
        actionStackView.alignment = .center
        
        [cancelButton, okButton].forEach { elem in
            elem.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview().inset(10)
            }
        }
        
        centerDivider.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
        
        contentView.addSubview(actionStackView)
        actionStackView.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override func binding() {
        cancelButton.rx.tap
            .bind { [unowned self] in
                dismiss(animated: false, completion: nil)
            }
            .disposed(by: disposeBag)
    }
    
    //MARK: - Helpers
    
    func show(parent: UIViewController?, completion: (() -> Void)? = nil) {
        guard let parent = parent else { return }
        
        var superVC: UIViewController
        
        if let tabBarVC = parent.tabBarController {
            superVC = tabBarVC
        } else {
            superVC = parent.navigationController == nil ? parent : parent.navigationController!
        }
        
        superVC.present(self, animated: false, completion: completion)
    }
}
