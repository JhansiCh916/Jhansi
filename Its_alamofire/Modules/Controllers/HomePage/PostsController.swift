//
//  PostsController.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 17/08/22.
//

import Foundation
import UIKit

class PostsController {
    
    var getUserId : Int?
    func getUserIdInfo() {
        getUserId = UserDefaults.standard.integer(forKey: "userid")
    }
    
    lazy var updateLikesViewModel : UpdateLikesviewModel = {
        return UpdateLikesviewModel()
    }()

    lazy var viewModelObject : ViewModel = {
        return ViewModel() }()
    
    lazy var networkObject :Network = {
        return Network() }()

    func start() {
        getUserIdInfo()
        self.viewModelObject.isTabelViewHidden.value = true
        self.viewModelObject.isLoading.value = true
        self.viewModelObject.title.value = "Loading.."
        networkObject.getPost(userId: getUserId ?? 0) { posts in
            self.viewModelObject.title.value = "Your Posts"
            self.viewModelObject.isTabelViewHidden.value = false
            self.viewModelObject.isLoading.value = false
            self.buildingPosts(posts: posts?.data ?? [])
        }
    }
    
    func buildingPosts(posts : [GetPostData]) {
        var rowsArray = [TableViewCellViewModel]()
        for post in posts {
            let profile : TableViewCellViewModel = TableViewCellViewModel(userName: post.userName ?? "", postData: post.postData ?? "", numberOfLikes: post.totalLikes ?? 0, likeStatus: post.likeStatus!,postId: post.postId ?? 0,userId: post.userId ?? 0)
            profile.likeBtnPressed = handleAddContact(userId: getUserId ?? 0, postId: post.postId ?? 0, status: post.likeStatus!,viewModel: profile)
            rowsArray.append(profile)
        }
        self.viewModelObject.sectionViewModels.value = rowsArray
    }
    
    func handleAddContact(userId : Int,postId : Int,status : Bool,viewModel : TableViewCellViewModel) -> (() -> Void) {
        return {
            self.updateLikesViewModel.callingUpdateLikes(userId: userId, postId: postId, likeStatus: !(status)) { response in
                self.start()
            }
        }
    }
}
