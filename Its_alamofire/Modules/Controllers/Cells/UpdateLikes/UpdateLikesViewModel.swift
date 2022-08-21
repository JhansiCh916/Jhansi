//
//  UpdateLikesViewModel.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 18/08/22.
//

import Foundation

class UpdateLikesviewModel {
    
    static let shared : UpdateLikesviewModel = UpdateLikesviewModel()
    let network = Network()
    var updateLikesResponseObject : UpdateLikesModel?
       
    func callingUpdateLikes(userId : Int,postId : Int,likeStatus : Bool,completion : @escaping(UpdateLikesModel?)->Void) {
        network.updateLikes(postId: postId, userId: userId, status: likeStatus) { response in
            self.updateLikesResponseObject = response
            completion(response)
        }
    }
    
    
}
