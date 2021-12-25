//
//  ViewModel.swift
//  PracticeRxSwift
//
//  Created by KS on 2021/12/25.
//

import Foundation
import RxCocoa
import RxSwift

struct ProdictViewModel {
    var items = PublishSubject<[Product]>()

    func fetchItems() {
        let products = [
            Product(imageName: "house", title: "Home"),
            Product(imageName: "gear", title: "Settings"),
            Product(imageName: "person.circle", title: "Profile"),
            Product(imageName: "airplane", title: "Flights"),
            Product(imageName: "bell", title: "Activity"),
        ]
        items.onNext(products)
        items.onCompleted()
    }
}
