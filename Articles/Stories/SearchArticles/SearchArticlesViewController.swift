//
//  SearchArticlesViewController.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit

class SearchArticlesViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var searchField: UITextField!
    
    // MARK: - Class Properties
    
    fileprivate let articlesListSegueIdentifier = "showArticles"
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == articlesListSegueIdentifier {
            let destinationViewController = segue.destination as! ArticlesListingViewController
            destinationViewController.articles = sender as! [ArticleShowable]
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func searchArticle(_ sender: Any) {
        if let searchText = searchField.text, !searchText.isEmpty {
            view.endEditing(true)
            var params = [String : Any]()
            params["q"] = searchText
            params["api-key"] = appConfigs.apiKey
            _ = ArticlesLoader().searchArticles(params, successBlock: {  [weak self] (articles) in
                guard let weakSelf = self else { return }
                weakSelf.performSegue(withIdentifier: weakSelf.articlesListSegueIdentifier, sender: articles)
            }) { (error) in
                print(error as Any)
            }
        }
    }
}
