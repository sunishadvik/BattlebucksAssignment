//
//  BaseViewController.swift
//  Assignment_Buttlebucks_Sunish_Ram
//
//  Created by Sunish Ram on 27/09/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    func pushVC(_ viewc : UIViewController, animated : Bool)
    {
        self.navigationController?.pushViewController( viewc, animated: true)
    }
    
    func popVC(animated : Bool)
    {
        self.navigationController?.popViewController(animated: animated)
    }
}
