//
//  NotchArea.swift
//  iphonex
//
//  Created by Leonard on 2017. 9. 20..
//  Copyright © 2017년 intmain. All rights reserved.
//

import UIKit

open class NotchArea {
    
    public static let instance = NotchArea()
    
    private class NotchView: UIView {
        static let cornerRadius: CGFloat = 40
        static let cornerY: CGFloat = 35
        override func draw(_ rect: CGRect) {
            let width = frame.width > frame.height ? frame.height : frame.width
            let rectPath = UIBezierPath()
            rectPath.move(to: CGPoint(x:0, y:0))
            rectPath.addLine(to: CGPoint(x: width, y: 0))
            rectPath.addLine(to: CGPoint(x: width, y: NotchView.cornerY))
            rectPath.addLine(to: CGPoint(x: 0, y: NotchView.cornerY))
            rectPath.close()
            rectPath.fill()
            let leftCornerPath = UIBezierPath()
            leftCornerPath.move(to: CGPoint(x: 0, y: NotchView.cornerY + NotchView.cornerRadius))
            leftCornerPath.addLine(to: CGPoint(x: 0, y: NotchView.cornerY))
            leftCornerPath.addLine(to: CGPoint(x: NotchView.cornerRadius, y: NotchView.cornerY))
            leftCornerPath.addQuadCurve(to:  CGPoint(x: 0, y: NotchView.cornerY+NotchView.cornerRadius), controlPoint: CGPoint(x: 0, y: NotchView.cornerY))
            leftCornerPath.close()
            leftCornerPath.fill()
            let rightCornerPath = UIBezierPath()
            rightCornerPath.move(to: CGPoint(x: width, y: NotchView.cornerY+NotchView.cornerRadius))
            rightCornerPath.addLine(to: CGPoint(x: width, y: NotchView.cornerY))
            rightCornerPath.addLine(to: CGPoint(x: width-NotchView.cornerRadius, y: NotchView.cornerY))
            rightCornerPath.addQuadCurve(to:  CGPoint(x: width, y: 35+NotchView.cornerRadius), controlPoint: CGPoint(x: width, y: NotchView.cornerY))
            rightCornerPath.close()
            rightCornerPath.fill()
        }
    }
    
    private var statusWindow: UIWindow = {
        let width = UIApplication.shared.keyWindow?.frame.width ?? 0
        let height = UIApplication.shared.keyWindow?.frame.height ?? 0
        
        let statusWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        statusWindow.windowLevel = UIWindowLevelStatusBar - 1
        
        let hairPowderView = NotchView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        hairPowderView.backgroundColor = UIColor.clear
        hairPowderView.clipsToBounds = true
        statusWindow.addSubview(hairPowderView)
        return statusWindow
    }()
    
    public func spread() {
        guard let window = UIApplication.shared.keyWindow else { return }
        if #available(iOS 11.0, *) {
            if window.safeAreaInsets.top > 0.0 {
                DispatchQueue.main.async { [weak self] in
                    self?.statusWindow.makeKeyAndVisible()
                    DispatchQueue.main.async {
                        window.makeKey()
                    }
                }
            }
        }
    }
}
