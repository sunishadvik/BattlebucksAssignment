//
//  Resource.swift
//  Assignment_Buttlebucks_Sunish_Ram
//
//  Created by Sunish Ram on 27/09/24.
//

import Foundation

struct Resource
{
    let utility = Utility()
    func getImagesData(completion : @escaping(_ result:imageData?) -> Void)
    {
        guard let url = URL(string: APIEndPoint.getImageURL) else {return}
        utility.fetchImageData(requestURL: url, resultType: imageData.self) { result in
            print(url)
             _ = completion(result)
        }
    }
}
