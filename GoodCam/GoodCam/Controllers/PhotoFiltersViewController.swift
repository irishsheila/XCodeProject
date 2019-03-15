//
//  PhotoFiltersViewController.swift
//  GoodCam
//
//  Created by Sheila Doherty on 3/13/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit

protocol PhotoFilterViewControllerDelegate {
    
    func photoFilterDone()
    
    func photoFilterCancel()
}

class PhotoFiltersViewController: UIViewController, FiltersScrollViewDelegate {
    
    @IBAction func cancelButtonPressed() {
        self.delegate?.photoFilterCancel()
    }
    
    @IBAction func doneButtonPressed() {
        guard let selectedImage = self.photoImageView.image else {
            return
        }
        
        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            self.delegate?.photoFilterDone()
        }
    }
    
    var image: UIImage?
    var delegate: PhotoFilterViewControllerDelegate?
    private var filtersService: FilterService!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var filtersScrollView: FiltersScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        self.filtersService = FilterService()
        self.filtersScrollView.filterDelegate = self
        self.photoImageView.image = self.image        
    }
    
    func filterScrollViewDidSelectFilter(filter: CIFilter) {
        self.filtersService.applyFilter(filter: filter, to: self.image!) {
            self.photoImageView.image = $0
        }
    }
}
