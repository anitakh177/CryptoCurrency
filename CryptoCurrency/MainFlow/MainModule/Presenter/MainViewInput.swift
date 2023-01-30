//
//  MainViewInput.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

protocol MainViewInput: AnyObject {
    func reloadTableView()
    func loadSpinnerAnimation()
    func hideSpinnerAnimation()
    func pushLoginModule()
}
