//
//  RowViewModel.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 17/08/22.
//

import Foundation
protocol RowViewModel {}

protocol ViewModelPressible {
    var cellPressed: (()->Void)? { get set }
}
