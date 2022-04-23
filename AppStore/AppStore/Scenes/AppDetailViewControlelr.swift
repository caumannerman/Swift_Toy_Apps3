//
//  AppDetailViewControlelr.swift
//  AppStore
//
//  Created by 양준식 on 2022/04/03.
//

import UIKit
import SnapKit

final class AppDetailViewController: UIViewController {
    private let today: Today
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        //이미지가 넘치지 않게
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    //받기 다운로드 버튼
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        
        return button
    }()
    
    
    
    init(today: Today){
        self.today = today
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //사용자가 선택한대로, 다크모드 혹은 밝은 색 ( 유연한 백그라운드 색상 )
        view.backgroundColor = .systemBackground

        setupViews()
        
        appIconImageView.backgroundColor = .lightGray
        titleLabel.text = today.title
        subTitleLabel.text = today.subTitle
        
    }
}

// MARK: Private
private extension AppDetailViewController{
    func setupViews(){
        [appIconImageView, titleLabel, subTitleLabel, downloadButton, shareButton].forEach{ view.addSubview($0)}
        
        appIconImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(32.0)
            $0.height.equalTo(100.0)
            $0.width.equalTo(appIconImageView.snp.height)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(appIconImageView.snp.top)
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
        
        subTitleLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        downloadButton.snp.makeConstraints{
            $0.bottom.equalTo(appIconImageView.snp.bottom)
            $0.height.equalTo(24.0)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.width.equalTo(60.0)
        }
        
        shareButton.snp.makeConstraints{
            $0.bottom.equalTo(downloadButton.snp.bottom)
            $0.trailing.equalToSuperview().inset(8.0)
            $0.width.equalTo(24.0)
            $0.height.equalTo(shareButton.snp.width)
        }
    }
    
    @objc func didTapShareButton(){
        let activityItems: [Any] = [today.title]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        present(activityViewController, animated:true)
        
    }
}
