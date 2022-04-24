//
//  ProfileCollectionViewCell.swift
//  InstagramUISample
//
//  Created by 양준식 on 2022/04/05.
//

import UIKit
import SnapKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    func setup(with image: UIImage){
        addSubview(imageView)
        imageView.snp.makeConstraints{ $0.edges.equalToSuperview()}
        
        imageView.backgroundColor = .tertiaryLabel
    }
}
