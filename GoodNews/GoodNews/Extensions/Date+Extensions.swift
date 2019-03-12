//
//  Date+Extensions.swift
//  GoodNews
//
//  Created by Sheila Doherty on 3/12/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation

extension Date {
    
    static func dateAsStringForTableViewHeader() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter.string(from: Date())
    }
}
