//
//  ViewController.swift
//  testlogin
//
//  Created by Nguyen Anh Tu on 5/17/20.
//  Copyright © 2020 Nguyen Anh Tu. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UITextField!
    var data: LoginModel? = LoginModel()
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.value(forKey: "email") != nil {
            self.navigationController?.pushViewController(HomeViewController(), animated: true)
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func loginTab(_ sender: Any) {
        var email = emailTextField.text
        var password = passwordTextField.text
        LoginViewModel.shared.doLogin(email : email!, password :  password!)
        LoginViewModel.shared.signalPush.subscribe(onNext: { event in
            if event == true {
                self.data = LoginViewModel.shared.data
                if self.data?.result ?? false {
                    UserDefaults.standard.set(email, forKey: "email")
                    UserDefaults.standard.set(password, forKey: "password")
                    self.navigationController?.pushViewController(HomeViewController(), animated: true)
                }else {
                    self.showAlert(message: self.data?.message ?? "")
                }
            }
        }).disposed(by: disposeBag)
        
    }
    
    func showAlert(message : String) {
        let alert = UIAlertController(title: "Thông báo", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

