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
    private let client_id = "0da3b116126e34da88f8"
    private let client_secret = "5f0e074688ac520816482649c0ea663cd78a7041"
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
    
    func requestiOSJWT(acccess_token:String) {
        
        let parameters = ["token":acccess_token]
        
        let headers: HTTPHeaders = ["content-type": "application/x-www-form-urlencoded"]
        
        AF.request(api_server_url+"/api/login/ios", method: .post, parameters: parameters, headers: headers).responseJSON { (response) in
            switch response.result {
            case let .success(json):
                if let json = json as? [String: Any] {
                    UserDefaults.standard.setValue(json["token"]!, forKey: "token")
                    self.updateUI?()
                }
            case let .failure(error):
                print(error)
            }
        }
        
    }
    
}
