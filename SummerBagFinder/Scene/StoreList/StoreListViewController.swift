//
//  StoreListViewController.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright (c) 2020 EUIGYOM KIM. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StoreListDisplayLogic: class {

}

class StoreListViewController: UIViewController {
    
    private struct Constant {
        static var storeCellIdentifier: String     = "StoreCell"
    }
    
    var interactor: StoreListBusinessLogic?

    lazy var tableView: UITableView = {
        let tableView = UITableView()

        tableView.register(UINib(nibName: "StoreListCell", bundle: nil) , forCellReuseIdentifier: Constant.storeCellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTableView()
    }
}

// MARK: - Setup

extension StoreListViewController {
    
    private func setupViews() {
        self.title = "재고 확인"
        self.edgesForExtendedLayout = [.all]
        
        view.backgroundColor = .systemBackground
    }
    
    private func setupTableView() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (maker) in
            maker.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            maker.bottom.equalToSuperview()
        }
        
        tableView.reloadData()
    }
}

extension StoreListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore?.dataList?.stores.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.storeCellIdentifier, for: indexPath)
        
        if let storeCell = cell as? StoreListCell, let store = dataStore?.dataList?.stores[indexPath.row] {
            let stock = dataStore?.getStoreStock(index: indexPath.row)
            
            storeCell.setStoreInfo(store)
            storeCell.setStockInfo(stock)
        }
        
        return cell
    }
}
