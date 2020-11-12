//
//  SignInViewController.swift
//  IssueTracker
//
//  Created by cho on 2020/10/29.
//  Copyright © 2020 ralph. All rights reserved.
//


import UIKit
import Alamofire
import AuthenticationServices

class SignInViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var idValidMessageLabel: UILabel!
    @IBOutlet weak var passwordValidMessageLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var signInGithubButton: UIButton!
    @IBOutlet weak var signInAppleButton: ASAuthorizationAppleIDButton!
    
    @IBOutlet weak var idErrorMessageLabel: UILabel!
    @IBOutlet weak var passwordErrorMessageLabel: UILabel!
    
    var didSendEventClosure: ((SignInViewController.Event)-> Void)?

    var loginSucceed: Bool = false {
        didSet {
            if loginSucceed {
                didSendEventClosure?(Event.signin)
            } else {
                
            }
        }
    }
    
    let viewModel = SignInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        idTextField.delegate = self
        passwordTextField.delegate = self
        viewModel.status.idErrorMessage.bind(idErrorLabelUpdate)
        viewModel.status.passwordErrorMessage.bind(passwordErrorLabelUpdate)
        viewModel.status.buttonEnabled.bindAndFire(buttonEnabledCheck)
        
        LoginManager.shared.updateUI = { [weak self] in
            self?.loginSucceed = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    func buttonEnabledCheck(idEnable: Bool, passwordEnable: Bool) {
        if idEnable, passwordEnable {
            self.loginButton.isUserInteractionEnabled = true
            self.loginButton.alpha = 1.0
        } else {
            self.loginButton.isUserInteractionEnabled = false
            self.loginButton.alpha = 0.3
        }
    }
    
    func idErrorLabelUpdate(id:String) {
        // view update
        if id.isEmpty {
            self.idErrorMessageLabel.isHidden = true
        } else {
            self.idErrorMessageLabel.text = id
            self.idErrorMessageLabel.isHidden = false
        }
    }
    
    func passwordErrorLabelUpdate(password:String) {
        // view update
        if password.isEmpty {
            self.passwordErrorMessageLabel.isHidden = true
        } else {
            self.passwordErrorMessageLabel.text = password
            self.passwordErrorMessageLabel.isHidden = false
        }
    }

    
    func setUI() {
        
        idTextField.setLabel("아이디")
        passwordTextField.setLabel("비밀번호")
        
    }
    
    @IBAction func signInWithGithubTabbed(_ sender: Any) {
        LoginManager.shared.requestCode()
    }
    
    @IBAction func signinWithAppleTabbed(_ sender: Any) {
        
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self as? ASAuthorizationControllerDelegate
        controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
        controller.performRequests()
        
    }
    
    @IBAction func signUpTabbed(_ sender: Any) {
        didSendEventClosure?(Event.signup)
    }
    
    @IBAction func signInTabbed(_ sender: Any) {
        
        guard let id = self.idTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        
        LoginManager.shared.requestLoginPost(userId: id, password: password) { success in
            self.loginSucceed = success
        }
        
    }
    
}

extension SignInViewController: ASAuthorizationControllerDelegate {
    
    
    //실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        showToast(message: "로그인 실패")
    }

    //성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let user = credential.user
            guard let identityToken = credential.identityToken else { return }
            guard let token = String(data: identityToken, encoding: .utf8) else { return }
            LoginManager.shared.requestiOSJWT(acccess_token: token) { success in
                if success {
                    UserDefaults.standard.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjIwLCJ1c2VySWQiOiIyMzUxODI2NSIsInBhc3N3b3JkIjpudWxsLCJuaWNrbmFtZSI6ImNob2psMTEyNSIsIk9BdXRoIjp0cnVlLCJyZXNvdXJjZVNlcnZlciI6ImdpdGh1YiIsImltYWdlIjpudWxsLCJjcmVhdGVkQXQiOiIyMDIwLTExLTA3VDA4OjAyOjQyLjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIwLTExLTA3VDA4OjAyOjQyLjAwMFoiLCJpYXQiOjE2MDUxNjMxNDR9.mqSt6cAGYHhe9eVhf8MSxG7FJeIowyTkxQNLpM5fU8k", forKey: "token")
                    UserDefaults.standard.setValue(11, forKey: "uid")
                    self.didSendEventClosure?(.signin)
                }
            }
        }
    }
    
    func showToast(message : String) {
        let width_variable:CGFloat = 100
        let toastLabel = UILabel(frame: CGRect(x: width_variable, y: self.view.frame.size.height-100, width: view.frame.size.width-2*width_variable, height: 35))
        // 뷰가 위치할 위치를 지정해준다. 여기서는 아래로부터 100만큼 떨어져있고, 너비는 양쪽에 10만큼 여백을 가지며, 높이는 35로
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
//        self.view.addSubview(toastLabel)
        
        UIApplication.shared.keyWindow?.addSubview(toastLabel)
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        viewModel.action.idTextFieldChanged(self.idTextField.text!)
        viewModel.action.passwordTextFieldChanged(self.passwordTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        loginButton.sendActions(for: .touchUpInside)
        return true
    }
    
}

extension SignInViewController {
    enum Event {
        case signin, signup
    }
}
