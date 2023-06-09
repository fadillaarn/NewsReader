//
//  Media.swift
//  NewsReaderApp
//
//  Created by Fadilla Nurhidayah on 30/04/23.
//

import Foundation

struct Media: Decodable {
    let type: String
    let caption: String
    let metadata: [MediaMetaData]
    
    enum CodingKeys: String, CodingKey{
        case type
        case caption
        case metadata = "media-metadata"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        self.caption = try container.decodeIfPresent(String.self, forKey: .caption) ?? ""
        self.metadata = try container.decodeIfPresent([MediaMetaData].self, forKey: .metadata) ?? []
    }
}
