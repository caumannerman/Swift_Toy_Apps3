//
//  AppViewController.swift
//  AppStore
//
//  Created by 양준식 on 2022/04/02.
//

import UIKit
import SnapKit

final class AppViewController: UIViewController{
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
        let exchangeCodeButtonView = ExchangeCodeButtonView(frame: .zero)
        
//        featureSectionView.backgroundColor = .red
//        rankingFeatureSectionView.backgroundColor = .blue
//        exchangeCodeButtonView.backgroundColor = .yellow
        //단순 스크롤 여유를 위한 UIView
        let spacingView = UIView()
        spacingView.snp.makeConstraints{
            $0.height.equalTo(100.0)
        }
        
        [ featureSectionView, rankingFeatureSectionView, exchangeCodeButtonView, spacingView ].forEach{
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupLayout()
        
    }
}

private extension AppViewController{
    
    func setupNavigationController(){
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout(){
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            //height를 고정시켜주면, 가로 스크롤 뷰가 됨. width를 고정시켜주었으므로, 세로 스크롤뷰가 됨.
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
