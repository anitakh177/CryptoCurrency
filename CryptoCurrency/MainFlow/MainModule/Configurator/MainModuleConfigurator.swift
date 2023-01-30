//
//  MainModuleConfigurator.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

final class MainModuleConfigurator {
    
    func configureMainModule() -> UIViewController {
        let view = MainViewController()
        let dataFetcher = DataFetcherService()
        let router = MainRouter()
        
        let presenter = MainViewPresenter(view: view, dataFetchService: dataFetcher)
        view.presenter = presenter
        presenter.router = router
        router.view = view
        return view
        
    }
}
