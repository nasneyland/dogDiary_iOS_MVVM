//
//  NetworkRouter.swift
//  dogDiary
//
//  Created by najin on 2024/02/04.
//

import Foundation
import Alamofire

protocol NetworkRouter: URLRequestConvertible {
    var baseURL: String { get }
    var endPoint: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var queries: [String: String]? { get }
}

extension NetworkRouter {
    
    // URLRequestConvertible 구현부 (-> Alamofire)
    func asURLRequest() throws -> URLRequest {
        let baseURL = URL(string: baseURL)!
        let url = baseURL.appendingPathComponent(endPoint)
    
        var request = URLRequest(url: url)
        request.method = httpMethod
        request.httpBody = body
        
        if let headers = headers {
            headers.forEach { header in
                request.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        do {
            if let body = body,
               let json = try? JSONSerialization.jsonObject(with: body, options: []) as? [String: Any] {
            }
        }
        
        request = try URLEncodedFormParameterEncoder().encode(queries, into: request)
        return request
    }
}
