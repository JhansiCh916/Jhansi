//
//  ViewModel.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 17/08/22.
//

import Foundation
class ViewModel {
    var postsModel : GetPostsModel?
    let network = Network()
    let isLoading = Observable<Bool>(value: true)
    let title = Observable<String>(value: "Loading..")
    let isTabelViewHidden = Observable<Bool>(value: false)
    let sectionViewModels = Observable<[TableViewCellViewModel]>(value: [])
    func callGetPosts(completion : @escaping(GetPostsModel?)->Void) {
        network.getPost(userId: 35) { response in
            completion(response)
        }
    }
}
