//
//  ContentView.swift
//  cdc-assessment-1-Maggie-SwiftUI
//
//  Created by 赵明慧 on 2024/11/18.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: CryptoViewModel = CryptoViewModel(cryptoList: CryptoModel())
    @State private var isAlertShowing = false
    var body: some View {
        switch viewModel.status {
        case .unknown, .fail:
            VStack {
                Button("Load Crypto") {
                    viewModel.getCryptoList()
                    isAlertShowing = viewModel.status == .fail
                }
                .alert(isPresented: $isAlertShowing) {
                    Alert(title: Text("Load Crypto With Error"),
                          message: Text("Load Crypto With Error"),
                          dismissButton: .default(Text("Dismiss")))
                }
                .padding()
            }
        case .success:
            VStack {
                List {
                    ForEach(viewModel.cryptoList?.data ?? [], id: \.self) {
                        NavigationLink($0.title) {
                            CryptoDetailView()
                        }
                    }
                    .listRowSpacing(10)
                }
            }
        }
    }
}

struct CryptoDetailView: View {
    var body: some View {
        Text("Hello everyone!")
    }
}
