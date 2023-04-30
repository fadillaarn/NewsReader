//
//  NewsResponse.swift
//  NewsReaderApp
//
//  Created by Fadilla Nurhidayah on 30/04/23.
//

import Foundation


struct NewsResponse: Decodable {
    let status: String
    let numResult: Int
    let results: [News]
    
    enum CodingKeys: String, CodingKey {
        case status
        case numResult
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        self.numResult = try container.decodeIfPresent(Int.self, forKey: .numResult) ?? 0
        self.results = try container.decodeIfPresent([News].self, forKey: .results) ?? []
    }
}
