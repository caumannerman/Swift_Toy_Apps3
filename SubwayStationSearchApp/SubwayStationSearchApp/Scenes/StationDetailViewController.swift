//
//  StationDetailViewController.swift
//  SubwayStationSearchApp
//
//  Created by 양준식 on 2022/04/23.
//

import SnapKit
import UIKit
import Alamofire

final class StationDetailViewController: UIViewController {
    private let station: Station
    private var realtimeArrivalList: [RealTimeArrival] = []
    
    //reload를 위한 UIRefreshControl
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
    
        return refreshControl
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: view.frame.width - 32.0, height: 100.0)
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(StationDetailCollectionViewCell.self, forCellWithReuseIdentifier: "StationDetailCollectinoViewCell")
        
        collectionView.dataSource = self
        //refreshControl 적용
        collectionView.refreshControl = refreshControl
        return collectionView
    }()
    
    init(station: Station){
        self.station = station
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = station.stationName
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        fetchData()
    }
    
    @objc private func fetchData(){
        
        let stationName = station.stationName
        let url = "http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/\(stationName.replacingOccurrences(of: "역", with: ""))"
    
        AF.request(url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
            .responseDecodable(of: StationArrivalDataResponse.self) { [weak self] response in
                // case 분기 전에 refresh를 끝내줘야함. 아니면 실패 시 멈추지 않음
                self?.refreshControl.endRefreshing()
                
                guard case .success(let data) = response.result else { print(response); return }
                
                self?.realtimeArrivalList = data.realtimeArrivalList
                self?.collectionView.reloadData()

                debugPrint(data.realtimeArrivalList)
            }.resume()
    }
}

extension StationDetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realtimeArrivalList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StationDetailCollectinoViewCell", for: indexPath) as? StationDetailCollectionViewCell else { return UICollectionViewCell()}
        let realtimeArrival = realtimeArrivalList[indexPath.row]
        cell.setup(with: realtimeArrival)
        return cell
    }
}
