//
//  ViewModel.swift
//  BattlebucksAssignment
//
//  Created by Sunish Ram on 27/09/24.
//

import Foundation

class ViewModel {
    
    var modelData : [ModelData]?
    let resource = Resource()
    
    func getImageListData(completion:@escaping(_ isSucces:Bool) -> Void)
    {
        resource.getImagesData { result in
            guard let result = result else {return}
            DispatchQueue.main.async {[weak self] in
                self?.modelData = result
                completion(true)
            }
        }
    }
}
