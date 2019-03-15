//
//  PhotoPreviewViewController.swift
//  GoodCam
//
//  Created by Sheila Doherty on 3/13/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit

class PhotoPreviewViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    
    var previewImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photoImageView.image = self.previewImage
        //self.photoImageView.contentMode = .scaleAspectFill
    }
    
}
