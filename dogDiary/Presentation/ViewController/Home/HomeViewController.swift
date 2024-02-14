//
//  HomeViewController.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import UIKit
import SnapKit
import RxViewController

class HomeViewController: BaseViewController {
    
    var coordinator: HomeCoordinator?
    
    private let selfView = HomeView()
    
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
        
    }
}
