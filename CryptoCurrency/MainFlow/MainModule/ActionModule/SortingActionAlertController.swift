//
//  SortingActionAlertController.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

final class SortingActionAlertController: UIAlertController {
    
    // MARK: - Properties
    
    private var output: SortingActionModuleOutput!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAler()
    }
    
    func configure(output: SortingActionModuleOutput) {
          self.output = output
      }
}

// MARK: - Private Methods

private extension SortingActionAlertController {
    
    func configureAler() {
        let sortAscending = UIAlertAction(title: "max price", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.output.sortAscending()
        }
        let sortDescending = UIAlertAction(title: "min price", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.output.sortDescending()
        }
        
        let showOneHourPrice = UIAlertAction(title: "1 hour price", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.output.showOneHourPrice()
        }
        let show24HourPrice = UIAlertAction(title: "24 hour price", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.output.show24HoursPrice()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            addAction(sortAscending)
            addAction(sortDescending)
            addAction(showOneHourPrice)
            addAction(show24HourPrice)
            addAction(cancelAction)
    }
}
