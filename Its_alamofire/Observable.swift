//
//  Observable.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 17/08/22.
//

import Foundation
class Observable<T> {
    var value : T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    private var valueChanged :((T) -> Void)?
    init(value : T) {
        self.value = value
    }
    func addObserver(fireNow : Bool = true , _ onChange: ((T)->Void)?) {
        valueChanged = onChange
        if fireNow {
            onChange?(value)
        }
    }
    func removeObserver() {
        valueChanged = nil
    }
}
