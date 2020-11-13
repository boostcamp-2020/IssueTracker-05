//
//  LoginManager.swift
//  IssueTracker
//
//  Created by cho on 2020/10/29.
//  Copyright © 2020 ralph. All rights reserved.
//
import Foundation
import KeychainSwift
import Alamofire

class LoginManager {
    
    var updateUI: (() -> Void)?
    
    static let shared = LoginManager()
    private init() { }
    private var client_id: String {
        (Bundle.main.infoDictionary?["APP_KEY"] as? String) ?? ""
    } 
    private var client_secret: String {
        (Bundle.main.infoDictionary?["API_SECRET_KEY"] as? String) ?? ""
    }
    private let api_server_url = "http://group05issuetracker.duckdns.org:49203"
    
    func requestCode() {
        let scope = "user"
        let urlString = "https://github.com/login/oauth/authorize?client_id=\(client_id)&scope=\(scope)"
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func requestAccessToken(with code: String) {
        let url = "https://github.com/login/oauth/access_token"
        
        let parameters = ["client_id": client_id,
                          "client_secret": client_secret,
                          "code": code]
        
        let headers: HTTPHeaders = ["Accept": "application/json"]
        
        AF.request(url, method: .post, parameters: parameters, headers: headers).responseJSON { (response) in
            switch response.result {
            case let .success(json):
                if let dic = json as? [String: String] {
                    let accessToken = dic["access_token"] ?? ""
                    KeychainSwift().set(accessToken, forKey: "accessToken")
                    print(dic)
                    if let token = dic["access_token"] {
                        self.requestJWT(acccess_token: token)
                    }
                }
                
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func requestJWT(acccess_token:String) {
        
        let parameters = ["token":acccess_token]
        
        let headers: HTTPHeaders = ["content-type": "application/x-www-form-urlencoded"]
        
        AF.request(api_server_url+"/api/login/github", method: .post, parameters: parameters, headers: headers).responseJSON { (response) in
            switch response.result {
            case let .success(json):
                if let json = json as? [String: Any] {
                    UserDefaults.standard.setValue(json["token"]!, forKey: "token")
                    
                    if let user = (json["user"] as? NSArray)?[0] as? [String: Any] {
                        UserDefaults.standard.setValue(user["uid"] as? Int, forKey: "uid")
                    }
                    
                    self.updateUI?()
                }
            case let .failure(error):
                print(error)
            }
        }
        
    }
    
    
    func getUser() {
        let url = "https://api.github.com/user"
        let accessToken = KeychainSwift().get("accessToken") ?? ""
        let headers: HTTPHeaders = ["Accept": "application/vnd.github.v3+json",
                                    "Authorization": "token \(accessToken)"]
        
        AF.request(url, method: .get, parameters: [:], headers: headers).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let json):
                print(json as! [String: Any])
            case .failure:
                print("")
            }
        })
    }
    
    func requestiOSJWT(acccess_token:String, handler: @escaping (Bool) -> Void) {
        handler(true)
    }
    
    func requestLoginPost(userId:String, password: String, handler: @escaping (Bool) -> Void) {
        
        let parameters = ["userId": userId,
                          "password": password]

        let headers: HTTPHeaders = ["Accept": "application/json"]
        
        AF.request(api_server_url + "/api/login", method: .post, parameters: parameters, headers: headers).responseJSON { (response) in
            switch response.result {
            case let .success(json):
                if let json = json as? [String: Any] {
                    UserDefaults.standard.setValue(json["token"]!, forKey: "token")
                    if let user = json["user"] as? [String: Any] {
                        UserDefaults.standard.setValue(user["uid"] as? Int, forKey: "uid")
                        handler(true)
                        return
                    }
                    handler(false)
                }
            case let .failure(error):
                print(error)
                handler(false)
            }
        }
    
    }
    
    func requestSignUpPost(userId: String, password: String, nickname: String, handler: @escaping (Bool) -> Void) {
        let url = "http://group05issuetracker.duckdns.org:49203"
        
        let parameters = ["userId": userId,
                          "password": password,
                          "nickname": nickname]
        
        let headers: HTTPHeaders = ["Accept": "application/json"]
        
        AF.request(url + "/api/signup", method: .post, parameters: parameters, headers: headers).responseJSON { (response) in
            switch response.result {
            case let .success(json):
                print(json)
                if let dic = json as? [String: String] {
                    let message = dic["message"] ?? ""
                    print(message)
                }
                handler(true)
            case let .failure(error):
                print(error)
                handler(false)
            }
        }
    }
    
}
