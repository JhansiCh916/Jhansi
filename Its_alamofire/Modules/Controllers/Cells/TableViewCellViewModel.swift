//
//  LikeCell.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 17/08/22.
//

import Foundation
import UIKit

class TableViewCellViewModel : RowViewModel {
    let userName : String
    let postData : String
    let numberOfLikes : Int
    let likeStatus : Bool
    let postId : Int
    let userId : Int
    var likeBtnPressed : (()-> Void)?

    init(
        userName : String,
        postData : String,
        numberOfLikes : Int,
        likeStatus :Bool,
        postId : Int,
        userId : Int,
        likeBtnPressed : (() -> Void)? = nil
    )
     {
         self.postData = postData
         self.userName = userName
         self.likeStatus = likeStatus
         self.numberOfLikes = numberOfLikes
         self.userId = userId
         self.postId = postId
         self.likeBtnPressed = likeBtnPressed
        }
}
