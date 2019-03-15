//
//  FiltersScrollView.swift
//  GoodCam
//
//  Created by Sheila Doherty on 3/13/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit
import CoreImage


protocol FiltersScrollViewDelegate {
    
    func filterScrollViewDidSelectFilter(filter: CIFilter)
}

class FiltersScrollView: UIScrollView {
    
    var filterDelegate: FiltersScrollViewDelegate?
    
    private var filtersService: FilterService!
    
    init(parentView: UIView, frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func registerTapGestureRecognizer(for view: UIView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func tapped(recognizer: UITapGestureRecognizer) {
        guard let selectedFilterImageView = recognizer.view as? UIImageView else {
            return
        }
        
        self.filterDelegate?.filterScrollViewDidSelectFilter(filter: FilterService.all()[selectedFilterImageView.tag])
    }
    
    private func commonInit() {
        self.filtersService = FilterService()
        setupFilters()
    }
    
    private func setupFilters() {
        var offset: CGFloat = 10.0
        
        for (index, filter) in FilterService.all().enumerated() {
            
            let filterImageView = UIImageView.imageForFilterView()
            registerTapGestureRecognizer(for: filterImageView)
            self.addSubview(filterImageView)
            filterImageView.tag = index
            filterImageView.isUserInteractionEnabled = true
            filterImageView.frame.origin.x = offset
            filterImageView.center.y = self.frame.height / 2
            
            offset += filterImageView.frame.width + filterImageView.frame.width / 4
            self.contentSize = CGSize(width: offset, height: self.frame.height)
            self.filtersService.applyFilter(filter: filter, to: filterImageView.image!) {
                filterImageView.image = $0
            }
            
        }
        
    }
}
