//
//  NewsDetailsViewController.swift
//  GoodNews
//
//  Created by Sheila Doherty on 3/12/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class NewsDetailsViewController: UIViewController {
    
    var article: Article!
    private var newsDetailsVM: NewsDetailsViewModel!
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        self.navigationItem.largeTitleDisplayMode = .never
        self.newsDetailsVM = NewsDetailsViewModel(article)
        self.title = self.newsDetailsVM.sourceName
        
        guard let url = self.newsDetailsVM.url,
            let newsDetailURL = URL(string: url) else {
                return
        }
        
        let request = URLRequest(url: newsDetailURL)
        self.webview.load(request)
    }
}
