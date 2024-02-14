//
//  DataBackupViewModel.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import Foundation
import RxSwift
import RxRelay

class DataBackupViewModel: ViewModelType {
    let dependencies: Dependencies
    
    var disposeBag: DisposeBag = .init()
    
    struct Input {
        var fetching: Observable<Void>
    }
    
    struct Output {
        var finishBackup: Observable<Bool>
    }
    
    struct Dependencies {
        let usecase: AuthUseCase
        let memberId: String
    }
    
    required init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func transform(input: Input) -> Output {
        let finishBackup = PublishRelay<Bool>()
        
        input.fetching
            .bind { value in
                self.dependencies.usecase.startDataBackup(memberId: self.dependencies.memberId)
                    .subscribe { result in
                        switch result {
                        case .next(_):
                            finishBackup.accept(true)
                        default:
                            finishBackup.accept(false)
                        }
                    }
                    .disposed(by: self.disposeBag)
            }
            .disposed(by: disposeBag)
        
        
        
        return Output(finishBackup: finishBackup.asObservable())
    }
}
