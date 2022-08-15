//
//  HomeService.swift
//  NaviSumit
//
//  Created by Sumit Kumar on 15/08/22.
//

import Foundation

struct HomeService {
    
    let service = NetworkService()
    
    func fetchPullRequests(completion: @escaping ([HomeModel]?, Error?) -> Void) {
        let url = String(format: Constants.baseURL + "repos/sumitKumar7/Demo/pulls?state=closed")
        
        service.fetchData(urlString: url,
                          httpMethod: HttpMethod.get) { (result: Result<[HomeModel], Error>) in
            
            switch result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
