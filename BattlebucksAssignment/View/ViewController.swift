//
//  ViewController.swift
//  BattlebucksAssignment
//
//  Created by Sunish Ram on 28/09/24.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var lblLoadingData: UILabel!
    @IBOutlet weak var CVImages: UICollectionView!
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblLoadingData.text = kLoading
        CVImages.isHidden = true
        CVImages.isPrefetchingEnabled = true
        CVImages.prefetchDataSource = self

        self.registerNib()
        viewModel.getImageListData { isSucces in
            DispatchQueue.main.async { [weak self] in
                self?.CVImages.isHidden = isSucces ? false : true
                self?.lblLoadingData.text = isSucces ? "" : kLoading
                self?.CVImages.reloadData()
            }
        }
    }
    
    private func registerNib()
    {
        let nibCard = UINib(nibName: ImageCVCell.identifier(), bundle: nil)
        self.CVImages.register(nibCard, forCellWithReuseIdentifier: ImageCVCell.identifier())
    }
 
}
