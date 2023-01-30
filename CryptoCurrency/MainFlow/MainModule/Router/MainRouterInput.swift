//
//  MainRouterInput.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

protocol MainRouterInput {
    func showActionModule(output: SortingActionModuleOutput)
    func showDetailModule(coin: Crypto)
}
