//
//  Common.swift
//  BattlebucksAssignment
//
//  Created by Sunish Ram on 27/09/24.
//

import Foundation
import UIKit

let mainSb = UIStoryboard.init(name: kMain, bundle: nil)

struct APIEndPoint{
    static let getImageURL = "https://jsonplaceholder.typicode.com/photos"
}

struct Constant
{
    static let screenWidth   = UIScreen.main.bounds.size.width
    static let screenHeight  = UIScreen.main.bounds.size.height
    
}

extension DetailsViewController {
    class func instance()->DetailsViewController {
        let vc = mainSb.instantiateViewController(withIdentifier: DetailsViewController.getStotyboardId()) as! DetailsViewController
        return vc
    }
}

extension UIViewController
{
    static func getStotyboardId() -> String
    {
        return String(describing: self)
    }
}

 
