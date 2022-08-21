//
//  Network.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 17/08/22.
//

import Foundation
import Alamofire

class Network {
    
    let baseUrl = "http://stagetao.gcf.education:3000/"
    
    func getPost(userId : Int,completion : @escaping(GetPostsModel?)-> Void) {
        AF.request("\(self.baseUrl)\(urls.getPosts.rawValue)\(userId)", method: .get).responseDecodable(of : GetPostsModel.self) { response in
                    completion(response.value)
        }
    }
    
    func login(encode : LoginRequest,completion : @escaping(LoginResponse?)->Void) {
        AF.request("\(baseUrl)\(urls.loginUrl.rawValue)", method: .post, parameters: encode, encoder:.json, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of : LoginResponse.self) { response in
            completion(response.value)
        }
    }
    
    func updateLikes(postId : Int,userId : Int,status : Bool,completion : @escaping(UpdateLikesModel?)-> Void) {
        AF.request("\(baseUrl)" + "\(urls.updateLikes.rawValue)\(postId)/\(userId)/\(status)",method: .put).responseDecodable(of :UpdateLikesModel.self) { response in
            completion(response.value)
        }
        
    }
}

enum urls : String {
    case loginUrl = "api/v1/login"
    case getPosts = "api/v1/posts/"
    case updateLikes = "api/v1/postLikes/"
}
