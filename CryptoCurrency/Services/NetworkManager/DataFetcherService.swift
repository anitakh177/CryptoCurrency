//
//  DataFetcherService.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

final class DataFetcherService {
    
var dataFetcher: DataFetcher

init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
    self.dataFetcher = dataFetcher
}

    func fetchCrypto(for text: String, completion: @escaping (Result<Crypto?, Error>) -> Void) {
        guard let encodedText = text.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }
        let url = String("https://data.messari.io/api/v1/assets/\(encodedText)/metrics")
        dataFetcher.fetchGenericJSONData(urlString: url, response: completion)
        
    }
    
    func fetchPricechange(for text: String, completion: @escaping(Result<PriceChange?, Error>) -> Void) {
        guard let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: Date()) else { return }
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let startDate = dateFormatter.string(from: previousMonth)
        let endDate = dateFormatter.string(from: Date())
        
        guard let encodedText = text.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }
        let url = String("https://data.messari.io/api/v1/assets/\(encodedText)/metrics/price/time-series?start=\(startDate)&end=\(endDate)&interval=1w")
        dataFetcher.fetchGenericJSONData(urlString: url, response: completion)
    }

    
}
