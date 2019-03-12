//
//  ThemeManger.swift
//  GoodNews
//
//  Created by Sheila Doherty on 3/11/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit

class ThemeManager {
    
    static func setUp() {
        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
