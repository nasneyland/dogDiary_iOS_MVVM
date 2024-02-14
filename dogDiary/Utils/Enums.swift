//
//  Enums.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case errorResponse(Error)
}
