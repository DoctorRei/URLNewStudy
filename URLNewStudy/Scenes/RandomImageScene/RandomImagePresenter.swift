//
//  RandomImagePresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import Foundation
import UIKit

//struct RegisterViewModel {
//    let name: String
//}

protocol IRandomImagePresenter {
    func render()
}

final class RandomImagePresenter {
    let router: IRandomImageRouter
    
    private weak var view: IRandomImageVC!
    
    init(view: IRandomImageVC, router: IRandomImageRouter) {
        self.view = view
        self.router = router
    }
}

extension RandomImagePresenter: IRandomImagePresenter {
    func render() {
        view.render()
    }
}
