//
//  TrendingMovies + Floating button.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/20/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension TrendingMoviesViewController {
    // Floating button
    func createFloatingButton() {
        var floatingButton = UIButton()
        floatingButton = UIButton(type: .custom)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        floatingButton.backgroundColor = .white
        floatingButton.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        floatingButton.addTarget(self, action: #selector(buttonClick(_:)), for: UIControl.Event.touchUpInside)
        // We're manipulating the UI, must be on the main thread:
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.addSubview(floatingButton)
                NSLayoutConstraint.activate([
                    keyWindow.trailingAnchor.constraint(equalTo: floatingButton.trailingAnchor, constant: 15),
                    keyWindow.bottomAnchor.constraint(equalTo: floatingButton.bottomAnchor, constant: 15),
                    floatingButton.widthAnchor.constraint(equalToConstant: 75),
                    floatingButton.heightAnchor.constraint(equalToConstant: 75)])
            }
            // Make the button round:
            floatingButton.layer.cornerRadius = 37.5
            floatingButton.layer.backgroundColor = StaticResources.CustomColors.beautifulBlueColor.cgColor
            // Add a black shadow:
            floatingButton.layer.shadowColor = UIColor.black.cgColor
            floatingButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            floatingButton.layer.masksToBounds = false
            floatingButton.layer.shadowRadius = 2.0
            floatingButton.layer.shadowOpacity = 0.5
            // Add a pulsing animation to draw attention to button:
            let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimation.duration = 0.4
            scaleAnimation.repeatCount = .greatestFiniteMagnitude
            scaleAnimation.autoreverses = true
            scaleAnimation.fromValue = 1.0;
            scaleAnimation.toValue = 1.05;
            floatingButton.layer.add(scaleAnimation, forKey: "scale")
        }
    }
}
