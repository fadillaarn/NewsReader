//
//  News.swift
//  NewsReaderApp
//
//  Created by Fadilla Nurhidayah on 30/04/23.
//

import Foundation

struct News: Decodable {
    let url: String
    let id: Int
    let publishDate: String
    let section: String
    let tittle: String
    let media: [Media]
    
    enum CodingKeys: String, CodingKey {
        case url
        case id
        case publishDate = "published_date"
        case section
        case tittle
        case media
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.publishDate = try container.decodeIfPresent(String.self, forKey: .publishDate) ?? ""
        self.section = try container.decodeIfPresent(String.self, forKey: .section) ?? ""
        self.tittle = try container.decodeIfPresent(String.self, forKey: .tittle) ?? ""
        self.media = try container.decodeIfPresent([Media].self, forKey: .media) ?? []
    }
}

