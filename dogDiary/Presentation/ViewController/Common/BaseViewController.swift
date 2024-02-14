//
//  BaseViewController.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        configureUI()
        binding()
    }
    
    //MARK: - Configure
    
    func configureNavigationController() {
        var backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        backBarButtonItem.tintColor = .black
        backBarButtonItem.setTitleTextAttributes([.font: UIFont.gSans(size: .medium), .foregroundColor: UIColor.black], for: .normal)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    func configureUI() { }
    func binding() { }
}
