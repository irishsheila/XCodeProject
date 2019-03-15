//
//  UIBarButtonItem+Extensions.swift
//  GoodList
//
//  Created by Sheila Doherty on 3/15/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    static func barButtonItemForAddTask(target: UIViewController, selector: Selector) -> UIBarButtonItem {
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: target, action: selector)
        return barButtonItem
    }
    
    static func barButtonItemForCancel(target: UIViewController, selector: Selector) -> UIBarButtonItem {
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: target, action: selector)
        return barButtonItem
    }
    
    static func barButtonItemForSave(target: UIViewController, selector: Selector) -> UIBarButtonItem {
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: target, action: selector)
        return barButtonItem
    }
}
