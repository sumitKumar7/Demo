//
//  HomeService.swift
//  NaviSumit
//
//  Created by Sumit Kumar on 15/08/22.
//

import Foundation

struct HomeService {
    
    func fetchPullRequests() {
        let Url = String(format: "https://api.github.com/repos/sumitKumar7/Demo/pulls")
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("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", forHTTPHeaderField: "token")
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
