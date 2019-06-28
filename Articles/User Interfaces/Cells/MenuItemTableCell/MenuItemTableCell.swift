//
//  MenuItemTableCell.swift
//  Articles
//
//  Created by Fahad Attique on 28/06/2019.
//  Copyright © 2019 Fahad Attique. All rights reserved.
//

import UIKit

class MenuItemTableCell: UITableViewCell {

    // MARK: - Life Cycle
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Functions

    func configure(title: String) {
        titleLabel.text = title
        accessoryType = .disclosureIndicator
    }
}
