//
//  StationResponse.swift
//  SubwayStationSearchApp
//
//  Created by 양준식 on 2022/04/23.
//

import Foundation


struct StationResponse: Decodable{
    
    private let searchInfo: SearchInfoBySubwayNameService
    
    //간단하게 가져다 쓸 수 있도록 연산프로퍼티
    var stations: [Station] { searchInfo.row }
    
    enum CodingKeys: String, CodingKey {
        case searchInfo = "SearchInfoBySubwayNameService"
    }
    
}
struct SearchInfoBySubwayNameService: Decodable{
    //row만 받아올 것임.
    var row: [Station] = []
}

struct Station: Decodable{
    let stationName: String
    let lineNumber: String
    
    enum CodingKeys: String, CodingKey{
        case stationName = "STATION_NM"
        case lineNumber = "LINE_NUM"
    }
}
