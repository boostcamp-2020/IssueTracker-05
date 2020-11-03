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
    
    let viewModel = SignInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        idTextField.delegate = self
        passwordTextField.delegate = self
        viewModel.status.idErrorMessage.bind(idErrorLabelUpdate)
        viewModel.status.passwordErrorMessage.bind(passwordErrorLabelUpdate)
        viewModel.status.buttonEnabled.bindAndFire(buttonEnabledCheck)
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

    func requestCode() {
        let scope = "repo,user"
        let client_id = "0da3b116126e34da88f8"
        let urlString = "https://github.com/login/oauth/authorize?client_id=\(client_id)&scope=\(scope)"
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func touchedSignInWithGithub(_ sender: Any) {
        LoginManager.shared.requestCode()
        LoginManager.shared.getUser()
    }
    
    @IBAction func touchedSignIinWithApple(_ sender: Any) {
        
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self as? ASAuthorizationControllerDelegate
        controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
        controller.performRequests()
        
    }
    
    @IBAction func touchedSignUp(_ sender: Any) {
        
        let signUpViewController = UIStoryboard(name: "SignUp", bundle: nil).instantiateViewController(identifier: String(describing: SignUpViewController.self))

        self.navigationController?.pushViewController(signUpViewController, animated: true)
        
    }
    
    @IBAction func touchedLogIn(_ sender: Any) {
        
        let url = "http://172.30.1.27:5000"
        
        let parameters = ["userId": self.idTextField.text,
                          "password": self.passwordTextField.text]

        let headers: HTTPHeaders = ["Accept": "application/json"]
        
        AF.request(url + "/api/login", method: .post, parameters: parameters, headers: headers).responseJSON { (response) in
            switch response.result {
            case let .success(json):
                if let json = json as? [String: Any] {
                    if let message = json["message"] {
                        self.showToast(message: message as! String)
                    } else {
                        print(json["user"])
                        print(json["token"])
                        let token = json["token"] as! String
                        UserDefaults.standard.set(token, forKey: "token")
                        let issueListMainViewController = UIStoryboard(name: "IssueList", bundle: nil).instantiateViewController(identifier: String(describing: IssueListMainViewController.self))
                        
                        let navController = UINavigationController(rootViewController: issueListMainViewController)
                        navController.navigationBar.topItem?.title = "이슈"
                        navController.navigationBar.prefersLargeTitles = true
                        navController.tabBarItem
                            = UITabBarItem(title: "이슈", image: nil, tag: 0)
                        
                        let labelListViewController = UIStoryboard(name: "LabelList", bundle: nil).instantiateViewController(identifier: String(describing: LabelListViewController.self))
                        labelListViewController.tabBarItem
                            = UITabBarItem(title: "레이블", image: nil, tag: 0)
                        
                        let milestoneListViewController = UIStoryboard(name: "MilestoneList", bundle: nil).instantiateViewController(identifier: String(describing: MilestoneListViewController.self))
                        milestoneListViewController.tabBarItem
                            = UITabBarItem(title: "마일스톤", image: nil, tag: 0)
                        
                        let tabBarController = UITabBarController()
                        tabBarController.tabBar.tintColor = UIColor.black
                        tabBarController.viewControllers
                            = [navController, labelListViewController, milestoneListViewController]
                        let scenedelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
                        
                        scenedelegate.window?.rootViewController = tabBarController
                    }
                }
            case let .failure(error):
                print(error)
            }
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
            let jwt = credential.identityToken
            
            print("User: \(user)")
            guard let email = credential.email else { return }
            print("Email: \(email)")
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
}
