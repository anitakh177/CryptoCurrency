//
//  DetailViewPresenter.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

final class DetailViewPresenter: DetailViewOutput {
    
    // MARK: - Properties
    
    var coin: Crypto?
    weak var view: DetailViewInput?
    private let dataFetchService: DataFetcherService
    var chartData = ChartData()
    var chartViewModel = [ChartViewModel]()
    var keyMetrics = [KeyMetricsModel]()
   
    
    // MARK: - Initializers
    
    init(coin: Crypto, dataFetchService: DataFetcherService) {
        self.coin = coin
        self.dataFetchService = dataFetchService
    }
    
    // MARK:  - Open Methods
    
    func loadData() {
        guard let name = coin?.data.name else { return }
        dataFetchService.fetchPricechange(for: name) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let price):
                self.prepareDataForChart(price: price)
                self.prepareDataForKeyMetrics()
            case .failure(let error):
                print(error.localizedDescription)
            }
        
        }
    }
    
}

// MARK: - Private Methods

private extension DetailViewPresenter {
    
    func prepareDataForChart(price: PriceChange?) {
        var priceDay = [Double: Double]()
        var firstDate = [Double: Date]()
        var id = [Double: UUID]()
        
        if let price = price?.data.values {
            for item in price {
                let date = Date(timeIntervalSince1970: item[0] / 1000)
                priceDay.updateValue(item[4], forKey: item[0])
                firstDate.updateValue(date, forKey: item[0])
                id.updateValue(UUID(), forKey: item[0])
            }
            
        }
        
        for key in priceDay.keys {
            let dailyPrice = ChartViewModel(id: id[key]!, price: priceDay[key]!, date: firstDate[key]!)
            self.chartViewModel.append(dailyPrice)
            self.chartViewModel.sort(by: { $0.date < $1.date})
        }
        self.chartData.priceChange = self.chartViewModel
    }
    
    func prepareDataForKeyMetrics() {
       
        if let coin = self.coin {
            var convertedMetric = "$" + (coin.data.marketData.priceUsd?.convertNumber() ?? "No Info")
            keyMetrics.append(KeyMetricsModel(title: "Price USD", number: convertedMetric))
            
            convertedMetric = "$" + (coin.data.marketData.realVolumeLast24_Hours?.convertNumber()  ?? "No Info")
            keyMetrics.append(KeyMetricsModel(title: "Real Volume 24h", number: convertedMetric))
            
            convertedMetric = "$" + (coin.data.marketcap.realizedMarketcapUsd?.convertNumber() ?? "No Info")
            keyMetrics.append(KeyMetricsModel(title: "Marketcap", number: convertedMetric))
            
            convertedMetric = "$" + (coin.data.marketcap.yPlus10MarketcapUsd?.convertNumber() ?? "No Info")
            keyMetrics.append(KeyMetricsModel(title: "Y+10 Marketcap", number:  convertedMetric))
            
            convertedMetric = "$" + (coin.data.marketcap.y2050_MarketcapUsd?.convertNumber() ?? "No Info")
            keyMetrics.append(KeyMetricsModel(title: "Y2050 Marketcap", number:  convertedMetric))
            
            convertedMetric = "$" + (coin.data.cycleLow.price?.convertNumber() ?? "No Info")
            keyMetrics.append(KeyMetricsModel(title: "Cycle Low", number: convertedMetric))
            
            convertedMetric = "on " + (coin.data.cycleLow.at?.convertDate() ?? "No Info")
            keyMetrics.append(KeyMetricsModel(title: "Cycle Low Date", number:  convertedMetric))
            convertedMetric = "%" + (coin.data.cycleLow.percentUp?.convertPercent() ?? "No Info")
            keyMetrics.append(KeyMetricsModel(title: "Up from Cycle Low", number: convertedMetric))
            
            convertedMetric = "$" + (coin.data.allTimeHigh.price?.convertNumber() ?? "No Info")
            keyMetrics.append(KeyMetricsModel(title: "ATH", number:  convertedMetric))
            
            convertedMetric = "on " + (coin.data.allTimeHigh.at?.convertDate() ?? "No Info")
            keyMetrics.append(KeyMetricsModel(title: "ATH Date", number:  convertedMetric))
            
            convertedMetric = "%" + (coin.data.allTimeHigh.percentDown?.convertPercent() ?? "Info Unavailable")
            keyMetrics.append(KeyMetricsModel(title: "Down from ATH", number: convertedMetric))
            
            self.view?.reloadView()
        }

    }
}
