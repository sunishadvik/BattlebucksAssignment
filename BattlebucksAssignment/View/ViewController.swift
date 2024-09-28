//
//  ViewController.swift
//  BattlebucksAssignment
//
//  Created by Sunish Ram on 28/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblLoadingData: UILabel!
    @IBOutlet weak var CVImages: UICollectionView!
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        lblLoadingData.text = "Loading..."
        CVImages.isHidden = true
        CVImages.isPrefetchingEnabled = true
        CVImages.prefetchDataSource = self

        self.registerNib()
        viewModel.getImageListData { isSucces in
            DispatchQueue.main.async { [weak self] in
 
                print("isSucces____:\(isSucces)")
                
                if isSucces
                {
                    self?.CVImages.isHidden = false
                    self?.lblLoadingData.text = ""
                    self?.CVImages.reloadData()
                }else{
                    self?.CVImages.isHidden = true
                    self?.lblLoadingData.text = "Loading..."
                }
            }
        }
    }
    
    private func registerNib()
    {
        let nibCard = UINib(nibName: ImageCVCell.identifier(), bundle: nil)
        self.CVImages.register(nibCard, forCellWithReuseIdentifier: ImageCVCell.identifier())
    }
 
}
/*
 if isSucces
 {
     self?.CVImages.isHidden = false
     self?.lblLoadingData.text = ""
     self?.CVImages.reloadData()
 }else{
     self?.CVImages.isHidden = true
     self?.lblLoadingData.text = "Loading..."
 }
 */
