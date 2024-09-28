//
//  LazyImageView.swift
//  Assignment_Buttlebucks_Sunish_Ram
//
//  Created by Sunish Ram on 27/09/24.
//

import Foundation
import UIKit
 
class LazyImageView: UIImageView {

    private let imageCache = NSCache<AnyObject, UIImage>()
    var currentDataTask: URLSessionDataTask?

    func loadImage(fromURL imageURL: URL, placeHolderImage: String) {
        // Reset the image view to placeholder before loading new image
        DispatchQueue.main.async {
            self.image = UIImage(named: placeHolderImage)
        }
        // Cancel any previously running task for image loading
        currentDataTask?.cancel()

        // Check cache first
        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject) {
            DispatchQueue.main.async {
                self.image = cachedImage
            }
            return
        }

        // Download the image asynchronously
        let task = URLSession.shared.dataTask(with: imageURL) { [weak self] data, response, error in
            guard let self = self, let data = data, let image = UIImage(data: data), error == nil else {
                return
            }

            // Cache the downloaded image
            self.imageCache.setObject(image, forKey: imageURL as AnyObject)

            // Update the image on the main thread
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
        currentDataTask = task
    }
}
