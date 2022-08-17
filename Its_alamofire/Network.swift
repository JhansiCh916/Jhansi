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
        DispatchQueue.main.async {
            sleep(2)
            DispatchQueue.main.async {
                AF.request("\(self.baseUrl)\(urls.getPosts.rawValue)\(userId)", method: .get).responseDecodable(of : GetPostsModel.self) { response in
                print(response)
                    completion(response.value)
                }
            }
        }
        
        
    }
}



enum urls : String {
    case loginUrl = "api/v1/login"
    case registerUrl = "api/v1/register"
    case displayUserProfile = "api/v1/profile/"
    case changePassword = "api/v1/changePassword/"
    case getPosts = "api/v1/posts/"
    case createPost = "api/v1/post"
    case deletePost = "api/v1/post/"
    case updateLikes = "api/v1/postLikes/"
    case displayFriends = "api/v1/userFriends/"
    case addNewFriend = "api/v1/friend"
    case deleteFriend = "api/v1/friend/"
    case logOut = "api/v1/logout/2"
    case suggestFriends = "api/v1/suggestFriends/"
    
}
