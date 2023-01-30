//
//  MainViewOutput.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

protocol MainViewOutput {
    init(view: MainViewInput, dataFetchService: DataFetcherService)
    var coinModel: [Crypto] { get set }
    func loadData()
    func sortAscending()
    func sortDescending()
    func showAlertController()
    var priceChange: [Double] { get set }
    var hourChange: String { get set }
    func showDetailModule(coin: Crypto)
    func logout()
    
    
}
