//
//  UIImage+Extension.swift
//  GoodNews
//
//  Created by Sheila Doherty on 3/12/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    static func imageForPlaceholder() -> UIImage {
        return UIImage(named: "placeholder")!
    }
    
    static func imageForHeadline(url: String, completion: @escaping (UIImage) -> ()) {
        guard let imageURL = URL(string: url) else {
            completion(UIImage.imageForPlaceholder())
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageURL) {
                if let downloadImage = UIImage(data: data) {
                    completion(downloadImage)
                }
            }
        }
    }
}
