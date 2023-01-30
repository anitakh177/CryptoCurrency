//
//  DetailViewOutput.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

import Foundation
import SwiftUI

protocol DetailViewOutput: AnyObject {
    var coin: Crypto? { get }
    init(coin: Crypto, dataFetchService: DataFetcherService)
    func loadData()
    var chartData: ChartData { get }
    var chartViewModel: [ChartViewModel] { get set }
    var keyMetrics: [KeyMetricsModel] { get set }
   
}
