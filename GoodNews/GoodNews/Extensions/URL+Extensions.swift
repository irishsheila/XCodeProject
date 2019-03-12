//
//  URL+Extensions.swift
//  GoodNews
//
//  Created by Sheila Doherty on 3/12/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation

extension URL {
    
    static func urlForTopHeadlines(for category: String) -> URL {
        
        return URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=")!
        
    }
}
