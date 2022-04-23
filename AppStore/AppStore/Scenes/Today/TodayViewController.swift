//
//  TodayViewController.swift
//  AppStore
//
//  Created by 양준식 on 2022/04/02.
//

import UIKit
import SnapKit

final class TodayViewController: UIViewController {
    private var todayList: [Today] = []
    
    private lazy var collectionView: UICollectionView = {
        //UICollectionView는 항상 layout이 필요하다
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(TodayCollectionViewCell.self, forCellWithReuseIdentifier: "todayCell")
        collectionView.register(TodayCollectionHeaderView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TodayCollectionHeaderView")
        
        return collectionView

        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        //autolayout을 snapkit을 사용하여 설정 
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        fetchData()
    }
}

extension TodayViewController: UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todayCell", for: indexPath) as? TodayCollectionViewCell else { return UICollectionViewCell()}
        
        let today = todayList[indexPath.item]
        //해당하는 Today객체를 전달해줘야함
        cell.setup(today: today)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayList.count
    }
    //header, footer 구분해서 작성
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TodayCollectionHeaderView", for: indexPath) as? TodayCollectionHeaderView else { return UICollectionReusableView() }
        
        header.setupViews()
        
        return header
    }
}

//sizeforItemAt => colectionView의 아이템 사이즈 설정
extension TodayViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 32.0
        return CGSize(width: width, height: width)
    }
    //header의 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width - 32.0, height: 100)
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let value: CGFloat = 16.0
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let today = todayList[indexPath.item]
        
        let vc = AppDetailViewController(today: today )
        present(vc, animated: true)
    }
}


private extension TodayViewController {
    //plist에서 데이터 가져오기
    func fetchData(){
        guard let url = Bundle.main.url(forResource: "Today", withExtension: "plist") else { return }
        
        do{
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([Today].self, from: data )
            
            todayList = result
        }catch {}
    }
}
