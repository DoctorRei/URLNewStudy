//
//  SelectedImageViewController.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import UIKit

protocol SelectedImageViewControllerProtocole: AnyObject {
    func render()
}

class SelectedImageViewController: UIViewController {

    var presenter: SelectedImagePresenterProtocole?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
}

extension SelectedImageViewController: SelectedImageViewControllerProtocole {
    func render() {
        
    }
}
