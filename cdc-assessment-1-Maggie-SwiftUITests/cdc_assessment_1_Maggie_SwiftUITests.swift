//
//  cdc_assessment_1_Maggie_SwiftUITests.swift
//  cdc-assessment-1-Maggie-SwiftUITests
//
//  Created by 赵明慧 on 2024/11/18.
//

import Testing
import XCTest
@testable import cdc_assessment_1_Maggie_SwiftUI

struct cdc_assessment_1_Maggie_SwiftUITests {

    @Test func testGetCryptoList() async throws {
        let viewModel = CryptoViewModel(cryptoList: CryptoModel())
        viewModel.getCryptoList()
        XCTAssertEqual(viewModel.cryptoList?.data?.count, 9)
    }

}
