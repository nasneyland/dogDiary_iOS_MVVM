//
//  AuthRepositoryImpl.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation
import RxSwift

class AuthRepositoryImpl: AuthRepository {
    
    private let service: NetworkService
    private let dataSource: AuthDataSource
    
    init(dataSource: AuthDataSource) {
        self.service = NetworkService()
        self.dataSource = dataSource
    }
    
    //MARK: - Methods
    
    func checkAuth(phone: String) -> Observable<String?> {
        return Observable.create { observer in
            observer.onNext(UserDatas.filter { $0.value.0 == phone }.first?.key)
            return Disposables.create()
        }
    }
    
    func startDataBackup(memberId: String) -> Observable<Bool?> {
        // 1.DogList 불러오기
        let ob: Single<UserDTO> = service.request(request: AuthRouter.getUser(id: memberId))
        ob.subscribe { data in
            print(data)
        }
        return Observable.just(false).asObservable()
        
    }
}
