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
    private var worker: IRandomImageWorker!
    weak var view: IRandomImageVC!
    
    init(view: IRandomImageVC, router: IRandomImageRouter, worker: IRandomImageWorker) {
        self.view = view
        self.router = router
        self.worker = worker
    }
}

extension RandomImagePresenter: IRandomImagePresenter {
    func render() {
        var image = UIImage()
        
        worker.getImage { dataImage in
            image = dataImage
            self.view.render(with: image) 
        }
    }
    
}

