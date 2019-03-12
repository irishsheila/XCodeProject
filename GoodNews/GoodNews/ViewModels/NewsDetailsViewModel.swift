//
//  NewsDetailsViewModel.swift
//  GoodNews
//
//  Created by Sheila Doherty on 3/12/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation

struct NewsDetailsViewModel {
    let article: Article
}

extension NewsDetailsViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension NewsDetailsViewModel {
    var sourceName: String {
        return self.article.sourceName
    }
    
    var url: String? {
        return self.article.url
    }
}
