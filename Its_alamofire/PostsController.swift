//
//  PostsController.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 17/08/22.
//

import Foundation

class PostsController {
    
    let viewModelObject = ViewModel()
    let networkObject = Network()
    
    func start() {
        
        self.viewModelObject.isTabelViewHidden.value = true
        self.viewModelObject.isLoading.value = true
        self.viewModelObject.title.value = "Loading.."
        networkObject.getPost(userId: 35) { posts in
            self.viewModelObject.title.value = "Your Posts"
            self.viewModelObject.isTabelViewHidden.value = false
            self.viewModelObject.isLoading.value = false
            self.buildingPosts(posts: posts!.data)
        }
    }
    
    func buildingPosts(posts : [GetPostData]) {
        
        var rowsArray = [TableViewCellViewModel]()
        for post in posts {
            let profile : TableViewCellViewModel = TableViewCellViewModel(userName: post.userName ?? "", postData: post.postData ?? "", numberOfLikes: post.totalLikes ?? 0)
            rowsArray.append(profile)
        }
        self.viewModelObject.sectionViewModels.value = rowsArray
    }
}
