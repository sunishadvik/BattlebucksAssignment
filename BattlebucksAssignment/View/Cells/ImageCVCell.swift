//
//  ImageCVCell.swift
//  Assignment_Buttlebucks_Sunish_Ram
//
//  Created by Sunish Ram on 28/09/24.
//

import UIKit

class ImageCVCell: UICollectionViewCell {

    @IBOutlet weak var imgView: LazyImageView!
    
    static let imageCache = NSCache<NSString, UIImage>()
 
    var imgDetailsModelData : ModelData?
    {
        didSet{
            displayImageData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = UIImage(named: kPlaceHolderImage)
        imgView.currentDataTask?.cancel()
    }

    func displayImageData() {
        guard let imageUrlString = imgDetailsModelData?.thumbnailUrl, let imageUrl = URL(string: imageUrlString) else {
            return
        }
        print(imageUrlString)
        imgView.loadImage(fromURL: imageUrl, placeHolderImage: kPlaceHolderImage)
    }

}
