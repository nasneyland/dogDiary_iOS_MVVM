//
//  AuthRouter.swift
//  dogDiary
//
//  Created by najin on 2024/02/12.
//

import Foundation
import Alamofire

enum AuthRouter {
    case getUser(id: String)
}

extension AuthRouter: NetworkRouter {
    var baseURL: String {  return APIKey.BASE_URL }
    
    var endPoint: String {
        switch self {
        case .getUser(let id): return "/diary/member/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default: return nil
        }
    }
    
    var body: Data?  {
        switch self {
        default: return nil
        }
    }
    
    var queries: [String : String]?  {
        switch self {
        default: return nil
        }
    }
}
