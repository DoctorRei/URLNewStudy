//
//  SettingsViewController.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import Foundation
import UIKit

protocol IFavoritesViewController: AnyObject {
    func render()
}

final class FavoritesViewController: UIViewController {
    
    var presenter: IFavoritesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .green
    }
}

extension FavoritesViewController: IFavoritesViewController {
    func render() {
        
    }
}
