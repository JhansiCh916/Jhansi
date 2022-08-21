//
//  LoginViewModel.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 18/08/22.
//

import Foundation

class LoginViewModel {
    
    var loginResponseObject : LoginResponse?
    lazy var networkObject : Network = {
        return Network() }()
    
    func callingLogin(mail: String ,userPassword : String,completion : @escaping(LoginResponse?)->Void) {
        networkObject.login(encode: LoginRequest(mail: mail, userPassword: userPassword)) { response in
            self.loginResponseObject = response
            completion(response)
        }
    }
}
