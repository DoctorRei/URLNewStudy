//
//  CustomNavigationController.swift
//  URLNewStudy
//
//  Created by Акира on 10.02.2024.
//

import UIKit

/// Здесь делаем два новых перехода, которые служат альтернативой стндартному переходу.
/// Проблема была с тем, что нативный переход работает с НавигейшнБаром и она некорректно работает.
/// При переходе наблюдается проблема, что на одном экране скрыт НавБар, а при переходе он должен быть активным
/// Соответственно анимация переода ломается и пофиксить ее на уровне нативных инструментов я не вижу способа
/// Кроме создания собственных переходов, которые исключают анимацию самого НавБара

extension UINavigationController {
    
    /// Альтернатива pushViewController(_ viewController, animated: Bool)
    
    func pushWithNewAnimation(controller: UIViewController) {
        let transition = setupAnimation(
            with: 0.3,
            type: .push,
            subtype: .fromRight,
            timingFuction: .easeInEaseOut)
        
        view.window?.layer.add(transition, forKey: kCATransition)
        pushViewController(controller, animated: false)
        
    }
    
    /// Альтернатива popViewController(animated: Bool)
    
    @objc func popWithNewAnimation() {
        let transition = setupAnimation(
            with: 0.2,
            type: .push,
            subtype: .fromLeft,
            timingFuction: .easeInEaseOut)
        
        view.window?.layer.add(transition, forKey: kCATransition)
        
        popViewController(animated: false)
    }
    
    /// Приватный метод установки анимации для перехода
    
   private func setupAnimation(
        with duration: CFTimeInterval,
        type: CATransitionType,
        subtype: CATransitionSubtype?,
        timingFuction: CAMediaTimingFunctionName
    ) -> CATransition {
        let transition = CATransition()
        transition.duration = duration
        transition.type = type
        transition.subtype = subtype
        transition.timingFunction = CAMediaTimingFunction(name: timingFuction)
        
        return transition
    }
}

