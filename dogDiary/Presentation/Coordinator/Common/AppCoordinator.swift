//
//  AppCoordinator.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation
import UIKit
import RxSwift

class AppCoordinator: NSObject, Coordinator {
    let presenter: MainNavigationController
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.presenter = MainNavigationController()
    }
    
    func start() {
        window.rootViewController = presenter
        
        if UserDefaultsManager.isLoggedIn {
            let coordinator = HomeCoordinator(presenter: presenter)
            coordinator.start()
        } else {
            if UserDefaultsManager.isCombackUser {
                let coordinator = WelcomeBackCoordinator(presenter: presenter)
                coordinator.start()
            } else {
                let coordinator = WelcomeCoordinator(presenter: presenter)
                coordinator.start()
            }
        }
        
        //MARK: TODO - Data Backup
//        let service = NetworkService()
//        service.backup()
//
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 20) {
//            print(service.result)
//        }
        
        window.makeKeyAndVisible()
    }
}
