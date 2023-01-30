//
//  MainViewPresenter.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

final class MainViewPresenter: MainViewOutput {
   
    // MARK: - Properties
    
    weak var view: MainViewInput?
    var dataFetchService: DataFetcherService
    var coinModel = [Crypto]()
    var router: MainRouterInput?
    var priceChange: [Double] = []
    var hourChange: String = "24h"
   
    
    // MARK: - Initializtion
    
    required init(view: MainViewInput, dataFetchService: DataFetcherService) {
        self.view = view
        self.dataFetchService = dataFetchService
    
    }
    
    // MARK: - Methods
    
    func loadData() {
        view?.loadSpinnerAnimation()
        let dispatchGroup = DispatchGroup()
        let cryptoArray = ["btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
       
        cryptoArray.forEach { [weak self] coin in
            dispatchGroup.enter()
            dataFetchService.fetchCrypto(for: coin) { [weak self] (result) in
                guard let self = self else { return }
                
                switch result {
                case .success(let coin):
                    if let coin = coin {
                        self.coinModel.append(coin)
                        self.priceChange.append(coin.data.marketData.percentChangeUsdLast24_Hours ?? 0)
                        dispatchGroup.leave()
                    }
                   
                case .failure(let error):
                    self.view?.hideSpinnerAnimation()
                    print(error.localizedDescription)
                }
                
            }
            
        }
                dispatchGroup.notify(queue: .main) {
                self.view?.reloadTableView()
                self.view?.hideSpinnerAnimation()
        }
    }
    
    func showAlertController() {
        router?.showActionModule(output: self)
    }
    
    func showDetailModule(coin: Crypto) {
        router?.showDetailModule(coin: coin)
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "login")
        view?.pushLoginModule()
    }
    
}

// MARK: - SortingActionModuleOutput

extension MainViewPresenter: SortingActionModuleOutput {
    func showOneHourPrice() {
        priceChange = coinModel.map { $0.data.marketData.percentChangeUsdLast1_Hour ?? 0}
        hourChange = "1h"
        view?.reloadTableView()
    }
    
    func show24HoursPrice() {
        priceChange = coinModel.map { $0.data.marketData.percentChangeUsdLast24_Hours ?? 0}
        hourChange = "24h"
        view?.reloadTableView()
    }
    
    func sortAscending() {
        coinModel.sort(by: { $0.data.marketData.priceUsd ?? 0 > $1.data.marketData.priceUsd ?? 0})
        priceChange.reverse()
        view?.reloadTableView()
    }
    
    func sortDescending() {
        coinModel.sort(by: {$0.data.marketData.priceUsd ?? 0 < $1.data.marketData.priceUsd ?? 0})
        priceChange.reverse()
        view?.reloadTableView()
    }
}

// MARK: - Private Methods

private extension MainViewPresenter {
    
   
}
