//
//  Coordinator.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation

protocol Coordinator: AnyObject {
    var presenter: MainNavigationController { get }
    
    func start()
}
