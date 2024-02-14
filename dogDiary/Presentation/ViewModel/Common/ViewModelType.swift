//
//  ViewModelType.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    associatedtype Dependencies
    
    init(dependencies: Dependencies)
    
    func transform(input: Input) -> Output
}
