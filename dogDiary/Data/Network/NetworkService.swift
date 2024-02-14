//
//  NetworkService.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation
import Alamofire
import RxSwift

class NetworkService {
    
    private(set) var session: Session
    
    init(with session: Session = .default) {
        self.session = session
    }
    
    func request<T>(request: URLRequestConvertible) -> Single<T> where T: Decodable {
        return Single.create { [unowned self] single in
            let request = session.request(request)
                .responseDecodable(of: T.self, decoder: JSONDecoder()) { result in
                    switch result.result {
                    case .success(let decodable):
                        single(.success(decodable))
                    case .failure(let error):
                        single(.error(error))
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    //MARK: TODO 2000부터 다시 백업하기
//    var result = ""
//
//    func backup() {
//        for i in (1500..<2000) {
//            let URL = APIKey.BASE_URL + AuthRouter.startBackup(id: String(i)).endPoint
//            let alamo = AF.request(URL, method: .get).validate(statusCode: 200..<300)
//            alamo.responseDecodable(of: UserAuthorization.self, decoder: JSONDecoder()) { (response) in
//                switch response.result {
//                case .success(let value):
//                    print(response)
//                    if value.id != 0 {
//                        self.result += "\"\(value.id)\":(\"\(value.phone)\",\"\(value.mail)\"),"
//                    }
//                case .failure(_):
//                    return
//                }
//            }
//        }
//    }
}

//struct UserAuthorization: Codable {
//    var id: Int
//    var phone: String
//    var mail: String
//}
