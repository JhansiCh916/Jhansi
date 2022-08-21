//
//  ViewModel.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 17/08/22.
//

import Foundation
class ViewModel {
    
    static let shared : ViewModel = ViewModel()
    
    var postsModel : GetPostsModel?
    let network = Network()
    let isLoading = Observable<Bool>(value: true)
    let title = Observable<String>(value: "Loading..")
    let isTabelViewHidden = Observable<Bool>(value: false)
    let sectionViewModels = Observable<[TableViewCellViewModel]>(value: [])
    
    func callGetPosts(userId : Int,completion : @escaping(GetPostsModel?)->Void) {
        network.getPost(userId: userId) { response in
            completion(response)
        }
    }
}
