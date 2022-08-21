//
//  UpdateLikesModel.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 18/08/22.
//

import Foundation

struct UpdateLikesModel : Codable{
    let status : String?
    let message : String?
    let data : UpdateLikesStatus
    let errorCode : String?
}

struct UpdateLikesStatus : Codable{
    let likeStatus : String?
    let count: String?
}
