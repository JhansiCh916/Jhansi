//
//  Model.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 17/08/22.
//

import Foundation
struct GetPostsModel:Codable{
    let status ,message : String?
    let data : [GetPostData]
    let errorCode : String?
}
struct GetPostData : Codable{
    let postId : Int?
    let userName : String?
    let postData : String?
    let totalLikes : Int?
    let likeStatus : Bool?
    let iscreated : String?
    let userId : Int?
}

