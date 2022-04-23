//
//  StationDetailCollectionViewCell.swift
//  SubwayStationSearchApp
//
//  Created by 양준식 on 2022/04/23.
//

import UIKit
import SnapKit


final class StationDetailCollectionViewCell: UICollectionViewCell{
    private lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var remainTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        
        return label
    }()
    
    
    
    func setup(with realtimeArrival: RealTimeArrival){
        
        setupLayouts()
        lineLabel.text = realtimeArrival.line
        remainTimeLabel.text = realtimeArrival.remainTime
    }
    
    func setupLayouts(){
        layer.cornerRadius = 12.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
        // background가 있어야 그림자가 설정되어 보여진다!!
        backgroundColor = .systemBackground
        
        [lineLabel, remainTimeLabel].forEach{ addSubview($0)}
        
        lineLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(16.0)
        }
        
        remainTimeLabel.snp.makeConstraints{
            $0.leading.equalTo(lineLabel)
            $0.top.equalTo(lineLabel.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
}

