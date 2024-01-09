//
//  ViewController.swift
//  URLNewStudy
//
//  Created by Акира on 22.12.2023.
//

import UIKit

protocol IRandomImageVC: AnyObject {
    func render()
}

class RandomImageVC: UIViewController {

    let testLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupView()
    }
}

//MARK: - Setup View

private extension RandomImageVC {
    func setupView() {
        view.backgroundColor = .cyan
        addSubViews()
        setupRandomImageLabel()
        setupLayout()
    }
}

//MARK: - Setup Label

private extension RandomImageVC {
    func setupRandomImageLabel() {
        testLabel.text = "Welcome"
        testLabel.textColor = .black
    }
}

//MARK: - Setting

private extension RandomImageVC {
    func addSubViews() {
        view.addSubview(testLabel)
    }
}

//MARK: - Layout

private extension RandomImageVC {
    private func setupLayout() {
        
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            testLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


//MARK: - Protocole

extension RandomImageVC: IRandomImageVC {
    func render() {
       print("Тут будут данные с экрана")
    }
}
