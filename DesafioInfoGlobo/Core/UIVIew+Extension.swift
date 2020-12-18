//
//  UIVIew+Extension.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/16/20.
//

import Foundation

import UIKit

extension UIView {
    
    func pin(_ view: UIView) {
        addSubview(view)
        
        let leadingConstraint = view.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailingConstraint = view.trailingAnchor.constraint(equalTo: trailingAnchor)
        let topConstraint = view.topAnchor.constraint(equalTo: topAnchor)
        let bottomConstraint = view.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}
