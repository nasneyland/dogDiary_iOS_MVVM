//
//  AuthUseCase.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation
import RxSwift

class AuthUseCase {
    
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }

    //MARK: - Configure
    
    func checkAuth(phone: String) -> Observable<String?> {
        return repository.checkAuth(phone: phone)
    }
    
    func startDataBackup(memberId: String) -> Observable<Bool?> {
        return repository.startDataBackup(memberId: memberId)
    }
}
