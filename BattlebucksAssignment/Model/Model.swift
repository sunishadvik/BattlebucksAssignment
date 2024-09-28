//
//  Model.swift
//  Assignment_Buttlebucks_Sunish_Ram
//
//  Created by Sunish Ram on 27/09/24.
//

import Foundation

typealias imageData = [ModelData]

struct ModelData: Decodable{
   
    let albumId : Int?
    let title , url , thumbnailUrl : String?
    
    enum CodingKeys: CodingKey {
        case albumId
        case title
        case url
        case thumbnailUrl
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.albumId = try container.decodeIfPresent(Int.self, forKey: .albumId)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.thumbnailUrl = try container.decodeIfPresent(String.self, forKey: .thumbnailUrl)
    }
    
}
