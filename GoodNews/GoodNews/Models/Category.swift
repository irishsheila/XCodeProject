//
//  Category.swift
//  GoodNews
//
//  Created by Sheila Doherty on 3/12/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation

struct Category {
    let title: String
    let articles: [Article]
    
    static func all() -> [String] {
        return ["Business", "Entertainment", "General", "Sports"]
    }
}
