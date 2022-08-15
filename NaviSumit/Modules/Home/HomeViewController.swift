//
//  HomeViewController.swift
//  NaviSumit
//
//  Created by Sumit Kumar on 14/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeView: HomeView!
    
    private let homeService = HomeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeService.fetchPullRequests()
    }


}

