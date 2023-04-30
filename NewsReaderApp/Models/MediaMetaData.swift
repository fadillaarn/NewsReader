//
//  MediaMetaData.swift
//  NewsReaderApp
//
//  Created by Fadilla Nurhidayah on 30/04/23.
//

import Foundation

struct MediaMetaData: Decodable {
    let url: String
    let format: String
    let height: Double
    let width: Double
    
    enum CodingKeys: String, CodingKey {
        case url
        case format
        case height
        case width
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decode(String.self, forKey: .url) ?? ""
        format = try container.decodeIfPresent(String.self, forKey: .format) ?? ""
        height = try container.decodeIfPresent(Double.self, forKey: .height) ?? 0.0
        width = try container.decodeIfPresent(Double.self, forKey: .width) ?? 0.0
    }
}
