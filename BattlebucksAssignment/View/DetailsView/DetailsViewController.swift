//
//  DetailsViewController.swift
//  BattlebucksAssignment
//
//  Created by Sunish Ram on 28/09/24.
//

import UIKit

class DetailsViewController: BaseViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var detailImageView: LazyImageView!
    var detailsViewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showImageDetails()
    }
}
