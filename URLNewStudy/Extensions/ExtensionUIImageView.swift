//
//  ExtensionUIImageView.swift
//  URLNewStudy
//
//  Created by Акира on 10.02.2024.
//

import UIKit
import Kingfisher


/// Демонстрация реализации одного из подходов к работе с фреймворком
///
/// В данном случае мы применяем загрузку через фреймворк KingFisher
/// let processor -  отвечает за то, чтобы ухудшить качество изображения и скачать его в указанных размерах (100х100 дефолт)
/// Это помогает не засорять память пользователя и так же облегчает работу коллекции
///
/// let options - настройка изображения и его отображения на экране + анимация

extension UIImageView {
    func configureForKingfisher(withURL url: String, width: Int = 100, height: Int = 100) {
        let processor = DownsamplingImageProcessor(
            size: CGSize(width: width, height: height)
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
