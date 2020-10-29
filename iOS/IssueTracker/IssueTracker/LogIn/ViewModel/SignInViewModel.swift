//
//  SignInViewModel.swift
//  IssueTracker
//
//  Created by cho on 2020/10/29.
//  Copyright © 2020 ralph. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ValidationViewModel {
     
    var errorMessage: String { get }
    
    // Observables
    var data: BehaviorRelay<String> { get set }
    var errorValue: BehaviorRelay<String?> { get}
    
    // Validation
    func validateCredentials() -> Bool
}

class EmailIdViewModel : ValidationViewModel {
     
    var errorMessage: String = "Please enter a valid Email Id"
    
    var data: BehaviorRelay<String> = BehaviorRelay(value: "")
    var errorValue: BehaviorRelay<String?> = BehaviorRelay(value: "")
    
    func validateCredentials() -> Bool {
        
        guard validatePattern(text: data.value) else {
            errorValue.accept(errorMessage)
            return false
        }
        
        errorValue.accept("")
        return true
    }
    
    func validatePattern(text : String) -> Bool{
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{6,16}"
//
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: text)
        
        return text.count >= 6 && text.count <= 16
    }
    
}

class PasswordViewModel : ValidationViewModel {
     
    var errorMessage: String = "Please enter a valid Password"
    
    var data: BehaviorRelay<String> = BehaviorRelay(value: "")
    var errorValue: BehaviorRelay<String?> = BehaviorRelay(value: "")
    
    func validateCredentials() -> Bool {
        
        guard validateLength(text: data.value, size: (6,15)) else{
            errorValue.accept(errorMessage)
            return false;
        }
        
        errorValue.accept("")
        return true
    }
    
    func validateLength(text : String, size : (min : Int, max : Int)) -> Bool{
        return (size.min...size.max).contains(text.count)
    }
}

class LoginViewModel {

    let model : LoginModel = LoginModel()
    let disposebag = DisposeBag()

    let emailIdViewModel = EmailIdViewModel()
    let passwordViewModel = PasswordViewModel()

    let isSuccess : BehaviorRelay<Bool> = BehaviorRelay(value: false)
    let isLoading : BehaviorRelay<Bool> = BehaviorRelay(value: false)
    let errorMsg : BehaviorRelay<String> = BehaviorRelay(value: "")

    
    
    func validateCredentials() -> Bool{
        return emailIdViewModel.validateCredentials() && passwordViewModel.validateCredentials();
    }

    func loginUser(){
        
        model.id = emailIdViewModel.data.value
        model.password = passwordViewModel.data.value
        
        self.isLoading.accept(true)
        
        print("login success")
        
    }
    
    
}

