//
//  SettingsViewController.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol SettingsViewControllerProtocole: AnyObject {
    func render()
}

final class SettingsViewController: UIViewController {
    
    var presenter: SettingsPresenterProtocole?
    var activityIndicator = UIActivityIndicatorView(style: .large)
    var tabbleView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
    }
    
}

//extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//    
//    
//}

extension SettingsViewController: SettingsViewControllerProtocole {
    func render() {
        
    }
    
}
