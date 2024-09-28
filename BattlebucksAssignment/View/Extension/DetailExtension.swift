//
//  DetailExtension.swift
//  BattlebucksAssignment
//
//  Created by Sunish Ram on 27/09/24.
//

import Foundation
import UIKit

extension DetailsViewController
{
    func showImageDetails()
    {
        DispatchQueue.main.async {[weak self] in
            self?.lblTitle.text = self?.detailsViewModel.imgDetailsModelData?.title ?? ""
            guard let imageUrl = URL(string: self?.detailsViewModel.imgDetailsModelData?.url ?? "") else{
                return
            }
            self?.detailImageView.loadImage(fromURL: imageUrl, placeHolderImage: kPlaceHolderImage)
        }
      
    }
}
