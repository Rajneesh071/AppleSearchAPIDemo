//
//  ViewController.swift
//  AppleSearchAPIDemo
//
//  Created by Rajneesh on 24/11/20.
//  Copyright © 2020 Nagarro. All rights reserved.
//

import UIKit
import SwiftUI

class AppleSearchResultVC: UIViewController {
    private let viewModel: AppleSearchResultViewModel
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView()
    
    init(viewModel: AppleSearchResultViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIView()
        
//        // Fetch initial dummy data
//        viewModel.fetchRecords(search: "johnson") { success in
//            if success {
//                self.tableView.reloadData()
//            }
//        }
    }
    
    private func setupUIView() {
        setupTableView()
        setupSearchBar()
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupSearchBar() {
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        tableView.tableHeaderView = searchController.searchBar
    }
    
}

extension AppleSearchResultVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalItem
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewModel.displayText(at: indexPath.row)
        cell.imageView?.image       = UIImage(named: "loading")
        cell.imageView?.contentMode = .scaleAspectFit
        viewModel.displayThumbnail(at: indexPath.row) { (image) in
            DispatchQueue.main.async(execute: {
                cell.imageView?.image = image
            })
        }
        return cell
    }
}

extension AppleSearchResultVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = viewModel.item(at: indexPath.row) {
            let playerVC = PlayerViewController(viewModel: DetailScreenViewModel(result: item))
            self.navigationController?.pushViewController(playerVC, animated: true)
        }
    }
    
}

extension AppleSearchResultVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchRecords(search: searchBar.text ?? "") { [weak self] success in
            if success {
                self?.searchController.isActive = false
                self?.tableView.reloadData()
            }
        }
    }
}

#if DEBUG
extension AppleSearchResultVC {
    func exposePrivateTableView() -> UITableView {
        return self.tableView
    }
    func exposePrivateSearchController() -> UISearchController {
        return self.searchController
    }
}
#endif
