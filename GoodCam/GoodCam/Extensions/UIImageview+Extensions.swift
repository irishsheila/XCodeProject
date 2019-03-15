//
//  UIImageview+Extensions.swift
//  GoodCam
//
//  Created by Sheila Doherty on 3/13/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    static func imageForFilterView() -> UIImageView {
        
        let filterImageView = UIImageView(image: UIImage(named: "filter-default-image"))
        filterImageView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 80, height: 80))
        filterImageView.layer.cornerRadius = 6.0
        filterImageView.layer.masksToBounds = true
        return filterImageView
        
    }
}
