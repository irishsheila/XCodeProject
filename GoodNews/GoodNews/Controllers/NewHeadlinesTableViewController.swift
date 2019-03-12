//
//  NewHeadlinesTableViewController.swift
//  GoodNews
//
//  Created by Sheila Doherty on 3/11/19.
//  Copyright © 2019 Sheila Doherty. All rights reserved.
//

import Foundation
import UIKit

class NewsHeadlinesTableViewController: UITableViewController {
    
    private var categoryListVM: CategoryListViewModel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpUI()
        populateHeadlinesAndArticles()
        
    }
    
    private func setUpUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.tableHeaderView = UIView.viewForTableViewHeader(subtitle: Date.dateAsStringForTableViewHeader())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsDetailsViewController" {
            prepareSegueForNewsDetails(segue)
        }
    }
    
    private func prepareSegueForNewsDetails(_ segue: UIStoryboardSegue) {
        guard let newsDetailsVC = segue.destination as? NewsDetailsViewController else {
            fatalError("NewsDetailsViewController is not defined")
        }
        
        guard let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Unable to get the selected row")
        }
        
        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).articleAtIndex(index: indexPath.row)
        newsDetailsVC.article = articleVM.article
    }
    
    private func populateHeadlinesAndArticles() {
        CategoryService().getAllHeadlinesForAllCategories { [weak self] categories in
            self?.categoryListVM = CategoryListViewModel(categories: categories)
            self?.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let name = self.categoryListVM.categoryAtIndex(index: section).name
        return UIView.viewForSectionHeader(title: name)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categoryListVM == nil ? 0 : self.categoryListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsHeadlineTableViewCell", for: indexPath) as? NewsHeadlineTableViewCell else {
            fatalError("NewsHeadlineTableViewCell no found")
        }
        
        let articleVM = self.categoryListVM.categoryAtIndex(index: indexPath.section).articleAtIndex(index: indexPath.row)
        cell.configure(vm: articleVM)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.categoryListVM.heightForHeaderInSection(section)
    }
    
    

}
