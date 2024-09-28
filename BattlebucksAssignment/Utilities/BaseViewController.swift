//
//  BaseViewController.swift
//  BattlebucksAssignment
//
//  Created by Sunish Ram on 27/09/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
