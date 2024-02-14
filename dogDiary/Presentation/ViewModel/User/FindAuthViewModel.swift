//
//  FindAuthViewModel.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation
import RxSwift
import RxRelay

class FindAuthViewModel: ViewModelType {
    let dependencies: Dependencies
    
    var disposeBag: DisposeBag = .init()
    
    struct Input {
        var tapValidateButton: Observable<String>
    }
    
    struct Output {
        var successFindAuth: Observable<String>
        var failFindAuth: Observable<Void>
    }
    
    struct Dependencies {
        let usecase: AuthUseCase
    }
    
    required init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func transform(input: Input) -> Output {
        let successFindAuth = PublishRelay<String>()
        let failFindAuth = PublishRelay<Void>()
        
        input.tapValidateButton
            .bind { value in
                self.dependencies.usecase.checkAuth(phone: value)
                    .subscribe { result in
                        switch result {
                        case .next(let memberId):
                            if let id = memberId {
                                successFindAuth.accept(id)
                            } else {
                                failFindAuth.accept(())
                            }
                        default:
                            failFindAuth.accept(())
                        }
                    }
                    .disposed(by: self.disposeBag)
            }
            .disposed(by: disposeBag)
        
        return Output(successFindAuth: successFindAuth.asObservable(), failFindAuth: failFindAuth.asObservable())
    }
}
