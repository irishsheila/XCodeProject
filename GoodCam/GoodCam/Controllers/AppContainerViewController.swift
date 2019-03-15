//
//  AppContainerViewController.swift
//  GoodCam
//
//  Created by Sheila Doherty on 3/13/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit

class AppContainerViewController: UIViewController, PhotoListCollectionViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, PhotoFilterViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let photoListCVC = self.children.first as? PhotoListCollectionViewController else {
            return
        }
        
        photoListCVC.delegate = self
        
    }
    
    func photoFilterCancel() {
        showPhotosList()
    }
    
    func photoFilterDone() {
        showPhotosList()
    }
    
    private func showPhotosList() {
        
        self.view.subviews.forEach {
            $0.removeFromSuperview()
        }
        
        guard let photoListCVC = self.storyboard?.instantiateViewController(withIdentifier: "PhotoListCollectionViewController") as? PhotoListCollectionViewController else {
            fatalError("PhotoListCollectionViewController does not exist")
        }
        
        photoListCVC.delegate = self
        self.addChildController(photoListCVC)
        
    }
    
    func photoListDidSelectImage(selectedImage: UIImage) {
        showImagePreview(previewImage: selectedImage)
    }
    
    private func showImagePreview(previewImage: UIImage) {
        
        guard let photoPreviewVC = self.storyboard?.instantiateViewController(withIdentifier: "PhotoPreviewViewController") as? PhotoPreviewViewController else {
            fatalError("PhotoPreviewViewController not found")
        }
        
        photoPreviewVC.previewImage = previewImage
        self.navigationController?.pushViewController(photoPreviewVC, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let originalImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        showPhotoFiltersViewController(for: originalImage)
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func showPhotoFiltersViewController(for image: UIImage) {
        
        guard let photoFiltersVC = self.storyboard?.instantiateViewController(withIdentifier: "PhotoFiltersViewController") as? PhotoFiltersViewController else {
            fatalError("PhotoFiltersViewController not found")
        }
        
        photoFiltersVC.image = image
        photoFiltersVC.delegate = self
        self.addChildController(photoFiltersVC)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraButtonPressed() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let imagePickerVC = UIImagePickerController()
            imagePickerVC.sourceType = .camera
            imagePickerVC.delegate = self
            self.present(imagePickerVC, animated: true, completion: nil)
            
        }
        
    }
    
}
