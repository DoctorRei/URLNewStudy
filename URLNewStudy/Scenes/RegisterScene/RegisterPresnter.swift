//
//  RegisterPresnter.swift
//  URLNewStudy
//
//  Created by Акира on 07.01.2024.
//

import Foundation

final class RegiterPresenter {
    private weak var view: IRegisterViewController!
    
    init(view: IRegisterViewController) {
        self.view = view
    }
}
