//
//  HomeViewController.swift
//  NaviSumit
//
//  Created by Sumit Kumar on 14/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var homeView: HomeView!
    
    // MARK: - Properties

    private let homeService = HomeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "Closed Pull Requests"
        makeNetworkCalls()
    }
    
    private func makeNetworkCalls() {
        homeService.fetchPullRequests { [self] pullRequests, error in
            if let pullRequests = pullRequests {
                DispatchQueue.main.async { [self] in
                    homeView.updateView(with: pullRequests)
                }
            } else {
                //FIXME: showing alert if github PAT Token Expired
                showTokenExpiryAlert()
            }
        }
    }
    
    private func showTokenExpiryAlert() {
        let alert = UIAlertController(title: "PAT Token Expired",
                                      message: "Please generate a new token to see the results",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}
