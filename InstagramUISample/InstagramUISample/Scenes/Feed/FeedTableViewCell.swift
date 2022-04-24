//
//  FeedTableViewCell.swift
//  InstagramUISample
//
//  Created by 양준식 on 2022/04/04.
//

import UIKit
import SnapKit



final class FeedTableViewCell: UITableViewCell{
    //cell에 들어가야할 컴포넌트들
    private lazy var postImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "heart")
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "message")
        return button
    }()
    
    private lazy var directMessageButton: UIButton = {
        let button = UIButton()
        
        button.setImage(systemName: "paperplane")
        return button
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        
        button.setImage(systemName: "bookmark")
        return button
    }()
    
    //~명이 좋아합니다 문구 라벨
    private lazy var currentLikedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "홍길동님 외 21명이 좋아라합니다"
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.numberOfLines = 5
        label.text = "이 게시물은 영국에서 안 시작되어, 글을 본 -10일 내에 -20곳에 글을 안 옮기지 아니하면, 별숙타구램에서 행복할 수 없는 가능성이 0이 되는 것이 불가능할 수 있을 수도 있다. 이 게시물의 내용을 무시하지 아니하고, 안 옮기는 행동을 하지 아니하는 것을 멈추지 않는다면, 그 이후로 좋아요를 받는 행동을 보지 못할 가능성이 0이 될 가능성이 사라질 수 있다"
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.text = "1일 전"
        
        return label
    }()
    
   

}



extension FeedTableViewCell{
    
    func setup(){
        [ postImageView, likeButton, commentButton, directMessageButton, bookmarkButton, currentLikedCountLabel, contentsLabel, dateLabel].forEach{ addSubview($0)}
        
        postImageView.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }
        
        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0
        
        likeButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        commentButton.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        directMessageButton.snp.makeConstraints{
            $0.leading.equalTo(commentButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        bookmarkButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        currentLikedCountLabel.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }
        
        contentsLabel.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(8.0)
        }
        
        dateLabel.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
    
   
    
    
}
