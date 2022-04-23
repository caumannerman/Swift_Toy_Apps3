//
//  Feature.swift
//  AppStore
//
//  Created by 양준식 on 2022/04/03.
//

import Foundation

struct Feature: Decodable{
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
