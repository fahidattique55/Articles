//
//  ArticlesListingViewController.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit

class ArticlesListingViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var articlesTableView: UITableView!

    // MARK: - Class Properties
    
    var articles = [ArticleShowable]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        viewConfigurations()
    }
    
    // MARK: - Functions
    
    func viewConfigurations() {
        
        articlesTableView.registerNib(from: ArticleTableCell.self)
        articlesTableView.estimatedRowHeight = 72
        articlesTableView.rowHeight = UITableView.automaticDimension
    }
}

extension ArticlesListingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: ArticleTableCell = tableView.dequeue(cell: ArticleTableCell.self) else { return UITableViewCell() }
        cell.configure(articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
