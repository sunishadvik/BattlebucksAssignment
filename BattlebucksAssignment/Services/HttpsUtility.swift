//
//  HttpsUtility.swift
//  Assignment_Buttlebucks_Sunish_Ram
//
//  Created by Sunish Ram on 27/09/24.
//

import Foundation


struct Utility
{
    func fetchImageData<T:Decodable>(requestURL : URL,resultType : T.Type , completionHandler:@escaping(_ result:T?) -> Void)
    {
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else{
                print("invalid data")
                return
            }
            let jsonDecoder = JSONDecoder()
            do{
                let results = try jsonDecoder.decode(T.self, from: data)
                _ = completionHandler(results)
            }
            catch(let error)
            {
                print(error)
            }
        }
        task.resume()
    }
}
