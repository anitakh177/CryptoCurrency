//
//  MainRouter.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

final class MainRouter: MainRouterInput {
  
    // MARK: - Properties
    
    weak var view: ModuleTransitionable?
    
    // MARK: - MainRouterInput
   
    func showActionModule(output: SortingActionModuleOutput) {
        let alertController = SortingActionAlertController(title: "Sort by", message: nil, preferredStyle: .actionSheet)
        alertController.configure(output: output)
        view?.presentModule(alertController, animated: true, completion: nil)
    }
    
    func showDetailModule(coin: Crypto) {
        let detailVC = DetailModuleConfigurator().configureDetailModule(coin: coin)
        view?.push(module: detailVC, animated: true)
    }
    
    
}
