//
//  CryptoViewModel.swift
//  cdc-assessment-1-Maggie-SwiftUI
//
//  Created by 赵明慧 on 2024/11/18.
//

import SwiftUI

public enum LoadDataStatus {
    case unknown
    case success
    case fail
}

class CryptoViewModel: ObservableObject {
    var cryptoList: CryptoModel?
    @Published var status: LoadDataStatus
    init(cryptoList: CryptoModel) {
        self.cryptoList = cryptoList
        self.status = .unknown
    }
    
    func getCryptoList() {
        self.status = .unknown
        guard let path = Bundle.main.path(forResource: "crypto_list", ofType: "json") else { return }
        print(path)
        let url = URL(fileURLWithPath: path)
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: url)
            let jsonObjects = try decoder.decode(CryptoModel.self, from: data)
            if let listData: [CryptoDetail] = jsonObjects.data {
                self.cryptoList?.data = listData
                self.status = .success
            } else {
                self.status = .fail
            }
            
        } catch {
            print("Error loading JSON: \(error)")
            self.status = .fail
        }
    }
}
