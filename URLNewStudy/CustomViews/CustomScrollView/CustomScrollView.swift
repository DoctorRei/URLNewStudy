//
//  CustomScrollView.swift
//  URLNewStudy
//
//  Created by Акира on 09.02.2024.
//

import UIKit

class CustomScrollView: UIScrollView {
    
    private let imageView = UIImageView()
    private var imageName: String? {
        didSet {
            guard let imageName = imageName else {
                return
            }
            imageView.image = UIImage(named: imageName)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    convenience init(named: String) {
        self.init(frame: .zero)
        self.imageName = named
    }
    
    private func commonInit() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        minimumZoomScale = 1
        maximumZoomScale = 6
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        delegate = self
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTapGesture)
    }
    
    @objc private func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        if zoomScale == 1 {
            setZoomScale(3, animated: true)
        } else {
            setZoomScale(1, animated: true)
        }
    }
    
}

extension CustomScrollView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}
