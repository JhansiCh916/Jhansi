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
    let isLoading: Observable<Bool>
  
    
    init(
        userName : String,
        postData : String,
        numberOfLikes : Int,
        isLoading: Observable<Bool> = Observable<Bool>(value: false))
     {
            self.isLoading = isLoading
          
            self.postData = postData
            self.userName = userName
            self.numberOfLikes = numberOfLikes
        }
}
