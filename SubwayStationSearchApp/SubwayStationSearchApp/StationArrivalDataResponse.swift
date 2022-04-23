//
//  StationArrivalDataResponse.swift
//  SubwayStationSearchApp
//
//  Created by 양준식 on 2022/04/23.
//

import Foundation


struct StationArrivalDataResponse: Decodable{
    var realtimeArrivalList: [RealTimeArrival] = []
}


struct RealTimeArrival: Decodable{
    let line: String // ~행 ( ~방면 )
    let remainTime: String //도착까지 남은시간 or 전역출발
    let currentStation: String //현재 위치
    
    enum CodingKeys: String, CodingKey{
        case line = "trainLineNm"
        case remainTime = "arvlMsg2"
        case currentStation = "arvlMsg3"
    }
}
