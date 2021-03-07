//
//  UIView+Extensions.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/9/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    // render the view within the view's bounds, then capture it as image
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image(actions: { rendererContext in
            layer.render(in: rendererContext.cgContext)
        })
    }
    struct LoadingProgress {
        static let  loading : NVActivityIndicatorView = NVActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 70, height: 70), type: .ballRotateChase, color: ColorName.whiteTwo.color , padding: 2)
    }
    func processOnStart() {
        let activityIndicator = setupActivityIndicator()
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    func processOnStop() {
        self.isUserInteractionEnabled = true
        LoadingProgress.loading.stopAnimating()
    }

    // Start Loader
    func setupActivityIndicator() -> NVActivityIndicatorView {
        LoadingProgress.loading.tag = 333
        LoadingProgress.loading.center = self.center
        self.addSubview(LoadingProgress.loading)
        return LoadingProgress.loading

    }

}
