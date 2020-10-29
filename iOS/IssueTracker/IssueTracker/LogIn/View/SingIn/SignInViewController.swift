//
//  SignInViewController.swift
//  IssueTracker
//
//  Created by cho on 2020/10/29.
//  Copyright © 2020 ralph. All rights reserved.
//


import RxCocoa
import RxSwift
import UIKit
import KeychainSwift
import Alamofire

class SignInViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var idValidMessageLabel: UILabel!
    @IBOutlet weak var passwordValidMessageLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signInGithubButton: UIButton!
    @IBOutlet weak var signInAppleButton: UIButton!
    
    let viewModel = LoginViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bindUI()
        createCallBack()
    }
    
    func setUI() {
        
        idTextField.setLabel("아이디")
        passwordTextField.setLabel("비밀번호")
        
    }
    
    func bindUI() {
//        idTextField.rx.text.orEmpty.map(IdValidationChecker().validate).distinctUntilChanged()
//            .subscribe(onNext: { text in
//
//                switch text {
//                case .invalidIdlength:
//                    self.idTextField.layer.borderColor = UIColor.red.cgColor
//                    self.idTextField.layer.borderWidth = 1.0
//                default:
//                    self.idTextField.layer.borderWidth = 0.0
//                }
//
//        }).disposed(by: disposeBag)
//
//        passwordTextField.rx.text.orEmpty.map(PasswordValidationChecker().validate).distinctUntilChanged().subscribe(onNext: { text in
//
//            switch text {
//            case .invalidPwlength:
//                self.passwordTextField.layer.borderColor = UIColor.red.cgColor
//                self.passwordTextField.layer.borderWidth = 1.0
//            default:
//                self.passwordTextField.layer.borderWidth = 0.0
//            }
//
//        })
        
        idTextField.rx.text.orEmpty.bind(to: viewModel.emailIdViewModel.data).disposed(by: disposeBag)
        passwordTextField.rx.text.orEmpty.bind(to: viewModel.passwordViewModel.data).disposed(by: disposeBag)

        loginButton.rx.tap.do(onNext: { [unowned self] in
            self.idTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
        }).subscribe(onNext: { [unowned self] in
            if self.viewModel.validateCredentials() {
                self.viewModel.loginUser()
            }
        }).disposed(by: disposeBag)
        
        signInAppleButton.rx.tap.do(onNext: { [unowned self] in
            self.requestCode()
        }).subscribe(onNext: { [unowned self] in
            
        }).disposed(by: disposeBag)
        
    }
    
    func createCallBack() {
        
        // success
         viewModel.isSuccess.asObservable()
             .bind{ value in
                 NSLog("Successfull")
             }.disposed(by: disposeBag)
         
         // errors
         viewModel.errorMsg.asObservable()
             .bind { errorMessage in
                 // Show error
                 NSLog("Failure")
             }.disposed(by: disposeBag)
        
    }
    
    func requestCode() {
        let scope = "repo,user"
        let client_id = "0da3b116126e34da88f8"
        let urlString = "https://github.com/login/oauth/authorize?client_id=\(client_id)&scope=\(scope)"
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func ClickedEvent(_ sender: Any) {
        LoginManager.shared.requestCode()
        LoginManager.shared.getUser()
    }
    
    
}

extension UITextField {
    func setLabel(_ text: String) {
        
        let label = UILabel(frame: CGRect(x: 30, y: 5, width: 10, height: 10))
        label.text = text
        label.font = UIFont(name: label.font.fontName, size: 14)
        leftView = label
        leftViewMode = .always
        
    }
}

