//
//  MainViewController.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties

    var presenter: MainViewOutput?
    
    // MARK: - View
    
    private let tableView = UITableView()
    private let spinnerView = UIActivityIndicatorView()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        presenter?.loadData()
     
    }

}

// MARK: - Main View Input

extension MainViewController: MainViewInput, ModuleTransitionable {
    func pushLoginModule() {
        let loginModule = LoginModuleConfigurator().configureLoginModule()
        changeRootView(module: loginModule)
    }
    

    func hideSpinnerAnimation() {
        spinnerView.stopAnimating()
    }
    
    func loadSpinnerAnimation() {
        spinnerView.startAnimating()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
}

// MARK: - Private Methods

private extension MainViewController {
    
    func configureAppearance() {
        configureNavigation()
        configureTableView()
        configureSpinnerView()
        
    }
    
    func configureNavigation() {
        navigationItem.title = "Crypto Info"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: ImageConstants.upAndDownArrow), style: .plain, target: self, action: #selector(openSortingAlertAction))
        leftBarButtonItem.tintColor = Colors.purpleColor
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: ImageConstants.portrait), style: .plain, target: self, action: #selector(logout))
        rightBarButtonItem.tintColor = Colors.purpleColor
        navigationItem.rightBarButtonItem = rightBarButtonItem
    
    }
    
    @objc func openSortingAlertAction() {
        presenter?.showAlertController()
    }
    
    @objc func logout() {
        presenter?.logout()
    }
    
    func configureTableView() {
        tableView.backgroundColor = Colors.backgroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ParameteNameTableViewCell.self, forCellReuseIdentifier: "\(ParameteNameTableViewCell.self)")
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: "\(CoinTableViewCell.self)")
        tableView.separatorStyle = .none
        
        setTableViewConstaints()
        
    }
    
    func setTableViewConstaints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    func configureSpinnerView() {
        view.addSubview(spinnerView)
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        spinnerView.transform = CGAffineTransform.init(scaleX: 2, y: 2)
        spinnerView.color = Colors.purpleColor
        
        NSLayoutConstraint.activate([
            spinnerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
           
        ])
    }
    
}

// MARK: - Table View DataSource & Delegate

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return  1
        } else {
            guard let coins = presenter?.coinModel else { return 0}
            return coins.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ParameteNameTableViewCell.self)", for: indexPath) as? ParameteNameTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.backgroundColor = Colors.backgroundColor
            cell.configurePriceChangeLabel(title: presenter?.hourChange ?? "")
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CoinTableViewCell.self)", for: indexPath) as? CoinTableViewCell else { return UITableViewCell() }
            if  let coin = presenter?.coinModel[indexPath.row] {
                cell.configureDataSource(coin: coin)
                cell.backgroundColor = Colors.backgroundColor
                cell.configurePriceChange(priceChange: presenter?.priceChange[indexPath.row] ?? 0)
                
            }
        
            cell.selectionStyle = .none
            return cell
            
        default:
            return UITableViewCell()
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 40
        default:
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let coin = presenter?.coinModel {
            presenter?.showDetailModule(coin: coin[indexPath.row])
        }
    }
    
    
    
}

