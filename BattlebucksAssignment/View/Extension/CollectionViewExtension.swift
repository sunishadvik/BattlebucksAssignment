//
//  BattlebucksAssignment
//
//  Created by Sunish Ram on 27/09/24.
//

import Foundation
import UIKit

//#MARK: UICollectionViewDataSource, UICollectionViewDelegate
extension ViewController :  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.modelData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CVCell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCVCell.identifier(), for: indexPath) as! ImageCVCell
        CVCell.imgView.image = UIImage(named: kPlaceHolderImage)
        
        DispatchQueue.global().async {[weak self] in
            CVCell.imgDetailsModelData = self?.viewModel.modelData?[indexPath.item]
        }
        return CVCell
    }
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let selectedModelData = viewModel.modelData?[indexPath.item] else { return }
        
        let nextVc = DetailsViewController.instance()
        nextVc.detailsViewModel.imgDetailsModelData = selectedModelData
        self.pushVC(nextVc, animated: true)
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
     {
        return CGSize(width: Constant.screenWidth/4, height: Constant.screenWidth/4)
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
     }
}
 
extension ViewController: UICollectionViewDataSourcePrefetching {

    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            guard let imageUrlString = viewModel.modelData?[indexPath.item].thumbnailUrl, let imageUrl = URL(string: imageUrlString) else {
                continue
            }
            if ImageCVCell.imageCache.object(forKey: imageUrlString as NSString) == nil {
                URLSession.shared.dataTask(with: imageUrl).resume()
            }
        }
    }
}

