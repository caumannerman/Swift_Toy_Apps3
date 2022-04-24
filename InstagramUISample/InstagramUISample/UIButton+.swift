//
//  UIButton+.swift
//  InstagramUISample
//
//  Created by 양준식 on 2022/04/04.
//

import UIKit

extension UIButton{
    func setImage(systemName: String){
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = .zero
        
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}
