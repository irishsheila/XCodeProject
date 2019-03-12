//
//  UIView+Extensions.swift
//  GoodNews
//
//  Created by Sheila Doherty on 3/12/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    static func viewForTableViewHeader(subtitle: String) -> UIView {
        
        let screenRect = UIScreen.main.bounds
        let subtitleView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: screenRect.size.width, height: 44)))
        let subtitleLabel = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: screenRect.width, height: 44)))
        subtitleLabel.text = subtitle
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = UIColor.gray
        subtitleLabel.font = UIFont.fontForSectionHeaderTitle()
        subtitleView.addSubview(subtitleLabel)
        return subtitleView
    }
    
    static func viewForSectionHeader(title: String) -> UIView {
        
        let screenRect = UIScreen.main.bounds
        let headerView = UIView(frame: CGRect(x: 15, y: 0, width: screenRect.width, height: 60))
        headerView.backgroundColor = UIColor.white
        
        let sectionHeaderLabel = UILabel(frame: headerView.frame)
        sectionHeaderLabel.text = title.uppercased()
        sectionHeaderLabel.textColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        sectionHeaderLabel.font = UIFont.fontForSectionHeaderTitle()
        headerView.addSubview(sectionHeaderLabel)
        return headerView
    }
}
