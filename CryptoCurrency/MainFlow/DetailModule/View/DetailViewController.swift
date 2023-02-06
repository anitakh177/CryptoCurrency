//
//  DetailViewController.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit
import SwiftUI

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: DetailViewOutput?
    
    // MARK: - Views
    
    private let tableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        presenter?.loadData()

    }
    
}

// MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {
    func reloadView() {
        tableView.reloadData()
    }
    
}

// MARK: - Private Methods

private extension DetailViewController {
    
    func configureAppearance() {
        configureNavigationBar()
        configureTableView()
        seTableViewConstaints()
    }
    
    func configureNavigationBar() {
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: ImageConstants.arrowLeft), style: .plain, target: self, action: #selector(closeDetailVC))
        leftBarButtonItem.tintColor = Colors.purpleColor
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
    }
    
    func configureTableView() {
        var gradient = Gradient()
        gradient.purpleGradinet.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        
        view.layer.addSublayer(gradient.purpleGradinet)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = Colors.purpleColor
        tableView.register(DetailInfoTableCollectionCell.self, forCellReuseIdentifier: "\(DetailInfoTableCollectionCell.self)")
        tableView.register(ChartCollectoinViewCell.self, forCellReuseIdentifier: "\(ChartCollectoinViewCell.self)")

    }
    
    func seTableViewConstaints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    @objc func closeDetailVC() {
        navigationController?.popViewController(animated: true)
       
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let metrics = presenter?.keyMetrics.count else { return 0 }
        return section == 0 ? 1 : metrics
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ChartCollectoinViewCell.self)", for: indexPath) as? ChartCollectoinViewCell else { return UITableViewCell() }
            if let data = presenter?.chartData {
                cell.host(UIHostingController(rootView: ChartSwiftUIView().environmentObject(data)))
                cell.backgroundColor = .clear
                cell.selectionStyle = .none
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailInfoTableCollectionCell.self)", for: indexPath) as? DetailInfoTableCollectionCell else { return UITableViewCell() }
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            if let metrics = presenter?.keyMetrics[indexPath.row] {
                cell.configureDataSource(metric: metrics)

            }
            return cell
        default:
            return UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 280 : 50
    }
    
}

