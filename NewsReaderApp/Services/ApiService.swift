//
//  ApiService.swift
//  NewsReaderApp
//
//  Created by Fadilla Nurhidayah on 30/04/23.
//

import Foundation
import Alamofire

class ApiService {
    static let shared: ApiService = ApiService()
    private init() { }
    
    private let API_KEY = "poqAplnIabq4G81jyrGocLrIAYgT8W61"
    private let BASE_URL = "https://api.nytimes.com/svc/mostpopular/v2"
    
    func loadLatestNews(completion: @escaping (Result<[News], Error>) -> Void) {
        let urlString = "\(BASE_URL)/viewed/7.json"
        AF.request(urlString, method: HTTPMethod.get, parameters: ["api-key":  API_KEY]).validate()
            .responseDecodable(of:NewsResponse.self) {
                response in
                switch response.result {
                case .success(let newsResponse):
                    completion(.success(newsResponse.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
