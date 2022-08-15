//
//  NetworkService.swift
//  NaviSumit
//
//  Created by Sumit Kumar on 15/08/22.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

struct NetworkService {
    
    func fetchData<T: Decodable>(urlString: String,
                                 httpMethod: HttpMethod,
                                 completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.setValue(Constants.githubToken, forHTTPHeaderField: "token")
        request.timeoutInterval = 20
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(Result{ try JSONDecoder().decode(T.self, from: data) })
        }.resume()
    }
    
    /// downloadImage function will download the thumbnail images
    public static func downloadImage(url: URL,
                                     completion: @escaping (Result<Data, Error>) -> Void) {
        NetworkService.getData(url: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async() {
                completion(.success(data))
            }
        }
    }
    
    private static func getData(url: URL,
                                completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
