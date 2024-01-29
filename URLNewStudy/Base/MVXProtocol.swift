//
//  MVXProtocol.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol BaseAssemblyProtocole {
    func configure(viewController: UIViewController)
}

protocol BaseRoutingProtocole {
    func routeTo(scene: Any)
    init(navigationController: UINavigationController)
}
