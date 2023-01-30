//
//  DetailModuleConfigurator.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

final class DetailModuleConfigurator {
    
    func configureDetailModule(coin: Crypto) -> DetailViewController {
        let view = DetailViewController()
        let dataFetchService = DataFetcherService()
        let presenter = DetailViewPresenter(coin: coin, dataFetchService: dataFetchService)
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}
