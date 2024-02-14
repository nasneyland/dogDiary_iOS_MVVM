//
//  UserDefaultsManager.swift
//  dogDiary
//
//  Created by najin on 2024/02/10.
//

import Foundation

class UserDefaultsManager {
    private static let userDefault = UserDefaults.standard
    
    private static func getData<T: Codable>(forKey: String) -> T? {
        if let retrievedData = userDefault.object(forKey: forKey) as? Data {
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(T.self, from: retrievedData) {
                return data
            }
        }
        return nil
    }

    private static func setData<T: Codable>(newValue: T, forKey: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(newValue) {
            userDefault.setValue(encoded, forKey: forKey)
        }
    }

    //MARK: - Properties
    
    // 기존 멍하 앱 user_id
    static var combackUserId: String {
        get { getData(forKey: "id") ?? "" }
        set { setData(newValue: newValue, forKey: "id") }
    }
    
    // 기존 멍하 앱 이용 유저인지
    static var isCombackUser: Bool {
        get { combackUserId != "" }
    }
    
    // 로그인 된 유저인지
    static var isLoggedIn: Bool {
        get { getData(forKey: "isLoggedIn") ?? false }
        set { setData(newValue: newValue, forKey: "isLoggedIn") }
    }
}
