//
//  CryptoModel.swift
//  cdc-assessment-1-Maggie-SwiftUI
//
//  Created by 赵明慧 on 2024/11/18.
//

import Foundation

struct CryptoModel: Codable {
    var data: [CryptoDetail]?
}

struct CryptoDetail: Codable, Hashable {
    var title: String
}
