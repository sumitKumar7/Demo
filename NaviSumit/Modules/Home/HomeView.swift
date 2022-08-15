//
//  HomeView.swift
//  NaviSumit
//
//  Created by Sumit Kumar on 14/08/22.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - UIComponets
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .green
        tableView.register(HomeTableViewCell.self,
                           forCellReuseIdentifier: String(describing: HomeTableViewCell.self))
        return tableView
    }()
    
    // MARK: - Properties
    
    var pullRequests = [HomeModel]()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        setupTableView()
        setupTableViewConstraints()
    }
    
    func updateView(with data: [HomeModel]) {
        pullRequests = data
        tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupTableViewConstraints() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pullRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self)) as? HomeTableViewCell else {
            assertionFailure("Unable to find HomeTableViewCell in Function: \(#function) \n File: \(#file)")
            return UITableViewCell()
        }
        cell.configure(with: pullRequests[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
