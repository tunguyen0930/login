//
//  LoginViewModel.swift
//  testlogin
//
//  Created by Nguyen Anh Tu on 5/18/20.
//  Copyright © 2020 Nguyen Anh Tu. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import Combine

class LoginViewModel {
    static let shared = LoginViewModel()
    public let didChange = PassthroughSubject<LoginViewModel, Never>()
    @Published var data = LoginModel() {
        didSet {
            didChange.send(self)
        }
    }
    private init() {

    }
    var signalPush: PublishSubject<Bool> = PublishSubject<Bool>()


    func doLogin(email : String , password : String) {
        let param: [String: Any] = ["email" : email,"password" : password]
        Alamofire.request(API_URL, method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).responseString { (reponse) in
            switch reponse.result {
            case .success(let responseString):
//                print(responseString)
                let model = LoginModel(JSONString: "\(responseString)")
                self.data = model!
                KeychainManager.shared.saveString(value: self.data.data?.access_token == nil ? "" : self.data.data?.access_token ?? "", forkey: .token)
                self.signalPush.onNext(true)
            case .failure(_):
                print("error")
            }
        }
    }
}
