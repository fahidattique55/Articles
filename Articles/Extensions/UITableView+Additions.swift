//
//  UITableView+Additions.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerNib(from cellClass: UITableViewCell.Type) {
        let identifier = cellClass.identifier
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func registerCell(from cellClass: UITableViewCell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    func dequeue<T: Any>(cell: UITableViewCell.Type) -> T? where T : UITableViewCell {
        return dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }
    
    func registerNib(from headerFooterClass: UITableViewHeaderFooterView.Type) {
        let identifier = headerFooterClass.identifier
        register(UINib(nibName: identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func dequeue<T: Any>(headerFooter: UITableViewHeaderFooterView.Type) -> T? where T : UITableViewHeaderFooterView {
        return dequeueReusableHeaderFooterView(withIdentifier: headerFooter.identifier) as? T
    }
    
    func addRefreshControl(_ refresher: UIRefreshControl, withSelector selector:Selector) {
        refresher.addTarget(nil, action: selector, for: .valueChanged)
        if #available(iOS 10.0, *) {
            refreshControl = refresher
        } else {
            addSubview(refresher)
        }
    }
}
