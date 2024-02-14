//
//  AuthRepository.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation
import RxSwift

protocol AuthRepository: AnyObject {
    func checkAuth(phone: String) -> Observable<String?>
    func startDataBackup(memberId: String) -> Observable<Bool?>
}
