//
//  Login Model.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 18/08/22.
//

import Foundation

struct LoginRequest: Codable {
    let mail, userPassword: String?
}

struct LoginResponse : Codable {
    let status, message: String?
    let data: LoginResponseData?
    let errorCode: Int?
}

struct LoginResponseData: Codable {
    let userId : Int?
    let loginStatus: Bool?
}
