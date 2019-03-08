//
//  Date+Extensions.swift
//  HighWaters
//
//  Created by Sheila Doherty on 3/8/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation

extension Date {
    func formatAsString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
