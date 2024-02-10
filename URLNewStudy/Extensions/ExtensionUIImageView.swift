//
//  ExtensionUIImageView.swift
//  URLNewStudy
//
//  Created by Акира on 10.02.2024.
//

import UIKit
import Kingfisher

extension UIImageView {
    func configureForKingfisher(withURL url: String) {
        let processor = DownsamplingImageProcessor(
            size: CGSize(width: 100, height: 100)
        )
        
        let options: KingfisherOptionsInfo = [
            .processor(processor),
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
        ]
        
        kf.indicatorType = .activity
        kf.setImage(with: URL(string: url), options: options)
    }
}
