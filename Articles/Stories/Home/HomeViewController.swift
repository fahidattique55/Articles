//
//  HomeViewController.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var menuTableView: UITableView!
    
    // MARK: - Class Properties
    
    private let searchArticlesSegueIdentifier = "searchArticles"
    fileprivate let articlesListSegueIdentifier = "showArticles"

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewConfigurations()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == articlesListSegueIdentifier {
            let destinationViewController = segue.destination as! ArticlesListingViewController
            destinationViewController.articles = sender as! [ArticleShowable]
        }
    }

    // MARK: - Functions
    
    func viewConfigurations() {
        
        menuTableView.registerNib(from: MenuItemTableCell.self)
        menuTableView.estimatedRowHeight = 40
        menuTableView.rowHeight = UITableView.automaticDimension
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else {
            return 3
        }
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: MenuItemTableCell = tableView.dequeue(cell: MenuItemTableCell.self) else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            cell.configure(title: "Search Articles")
        }
        else {
            
            if indexPath.row == 0 {
                cell.configure(title: "Most Viewed")
            }
            else if indexPath.row == 1 {
                cell.configure(title: "Most Shared")
            }
            else if indexPath.row == 2 {
                cell.configure(title: "Most Emailed")
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.section == 0 {
            performSegue(withIdentifier: searchArticlesSegueIdentifier, sender: self)
        }
        else {
            
            var articleType = ArticleType.none
            
            if indexPath.row == 0 {
                articleType = .viewed
            }
            else if indexPath.row == 1 {
                articleType = .shared
            }
            else if indexPath.row == 2 {
                articleType = .emailed
            }
            else { return }
            
            var params = [String : Any]()
            params["api-key"] = appConfigs.apiKey
            _ = ArticlesLoader().getArticlesOf(type: articleType, params, successBlock: { [weak self]  (articles) in
                guard let weakSelf = self else { return }
                weakSelf.performSegue(withIdentifier: weakSelf.articlesListSegueIdentifier, sender: articles)
            }) { (error) in
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Search"
        }
        else {
            return "Popular"
        }
    }
}
